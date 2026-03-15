/*
  Infusion Drip Monitoring Prototype
  Final Arduino Sketch

  Main features:
  - IR sensor-based drop detection
  - drop counting with debounce-like minimum gap
  - flow calculation in mL/s and mL/min
  - exponential moving average smoothing
  - RGB LED status output
  - OLED display output
  - Serial Monitor output

  Final pin assignment:
  - SENSOR_PIN = 4
  - LED_R_PIN  = 9
  - LED_G_PIN  = 8
  - LED_B_PIN  = 5

  Notes:
  - sensor input uses INPUT_PULLUP
  - active drop state is interpreted as LOW
*/



#include <Wire.h>
#include <U8g2lib.h>

U8G2_SSD1306_128X64_NONAME_1_HW_I2C u8g2(U8G2_R0, U8X8_PIN_NONE);

const byte SENSOR_PIN = 4;

const byte LED_R_PIN = 9;
const byte LED_G_PIN = 8;
const byte LED_B_PIN = 5;

const int DROP_ACTIVE_STATE = LOW;
const unsigned long MIN_DROP_GAP_MS = 40;
const unsigned long MEASURE_INTERVAL_MS = 1000;

const float DROPS_PER_ML = 20.0;
const float EMA_ALPHA = 0.35;

// RGB-LED-TYP
// false = Common Cathode
// true  = Common Anode

const bool COMMON_ANODE = false;
const float LOW_FLOW_ML_MIN  = 0.67;
const float HIGH_FLOW_ML_MIN = 2.00;

const bool RUN_LED_TEST_AT_START = true;

bool lastActiveState = false;

unsigned long totalDrops = 0;
unsigned long intervalDrops = 0;
unsigned long lastDropTime = 0;
unsigned long lastMeasureTime = 0;

float mlPerSec = 0.0;
float mlPerMin = 0.0;
float filteredMlPerMin = 0.0;
float totalMl = 0.0;

void writeLedPin(byte pin, bool on) {
  if (COMMON_ANODE) {
    digitalWrite(pin, on ? LOW : HIGH);
  } else {
    digitalWrite(pin, on ? HIGH : LOW);
  }
}

void setRGB(bool redOn, bool greenOn, bool blueOn) {
  writeLedPin(LED_R_PIN, redOn);
  writeLedPin(LED_G_PIN, greenOn);
  writeLedPin(LED_B_PIN, blueOn);
}

void setRed() {
  setRGB(true, false, false);
}

void setGreen() {
  setRGB(false, true, false);
}

void setBlue() {
  setRGB(false, false, true);
}

void setOff() {
  setRGB(false, false, false);
}

void runLedStartupTest() {
  setRed();
  delay(500);

  setGreen();
  delay(500);

  setBlue();
  delay(500);

  setOff();
  delay(300);
}

void updateLED(float flowMlMin) {
  if (flowMlMin < LOW_FLOW_ML_MIN) {
    setRed();
  } else if (flowMlMin <= HIGH_FLOW_ML_MIN) {
    setGreen();
  } else {
    setBlue();
  }
}

void printFlowStateToDisplay() {
  if (filteredMlPerMin < LOW_FLOW_ML_MIN) {
    u8g2.print("LOW");
  } else if (filteredMlPerMin <= HIGH_FLOW_ML_MIN) {
    u8g2.print("OK");
  } else {
    u8g2.print("FAST");
  }
}

void drawDisplay() {
  u8g2.firstPage();
  do {
    u8g2.setFont(u8g2_font_6x10_tf);

    u8g2.setCursor(0, 10);
    u8g2.print("Infusion Monitor");

    u8g2.setCursor(0, 22);
    u8g2.print("State: ");
    printFlowStateToDisplay();

    u8g2.setCursor(0, 34);
    u8g2.print("Drops: ");
    u8g2.print(totalDrops);

    u8g2.setCursor(0, 46);
    u8g2.print("ml total: ");
    u8g2.print(totalMl, 2);

    u8g2.setCursor(0, 56);
    u8g2.print("ml/s: ");
    u8g2.print(mlPerSec, 3);

    u8g2.setCursor(72, 56);
    u8g2.print("mL/m:");
    u8g2.print(filteredMlPerMin, 2);

  } while (u8g2.nextPage());
}

void printSerial() {
  Serial.print("Drops total: ");
  Serial.print(totalDrops);

  Serial.print(" | Interval: ");
  Serial.print(intervalDrops);

  Serial.print(" | ml/s: ");
  Serial.print(mlPerSec, 3);

  Serial.print(" | ml/min: ");
  Serial.print(filteredMlPerMin, 2);

  Serial.print(" | total ml: ");
  Serial.println(totalMl, 2);
}

void setup() {
  Serial.begin(9600);

  pinMode(SENSOR_PIN, INPUT_PULLUP);

  pinMode(LED_R_PIN, OUTPUT);
  pinMode(LED_G_PIN, OUTPUT);
  pinMode(LED_B_PIN, OUTPUT);

  setOff();

  u8g2.begin();

  totalDrops = 0;
  intervalDrops = 0;
  lastDropTime = 0;
  lastMeasureTime = millis();

  mlPerSec = 0.0;
  mlPerMin = 0.0;
  filteredMlPerMin = 0.0;
  totalMl = 0.0;

  if (RUN_LED_TEST_AT_START) {
    runLedStartupTest();
  }

  updateLED(0.0);
  drawDisplay();

  Serial.println("System gestartet.");
}


void loop() {
  unsigned long now = millis();

  bool activeNow = (digitalRead(SENSOR_PIN) == DROP_ACTIVE_STATE);

  if (activeNow && !lastActiveState) {
    if (now - lastDropTime >= MIN_DROP_GAP_MS) {
      totalDrops++;
      intervalDrops++;
      lastDropTime = now;
    }
  }

  lastActiveState = activeNow;

  // Jede Sekunde auswerten
  if (now - lastMeasureTime >= MEASURE_INTERVAL_MS) {
    float elapsedSec = (now - lastMeasureTime) / 1000.0;

    mlPerSec = (intervalDrops / DROPS_PER_ML) / elapsedSec;
    mlPerMin = mlPerSec * 60.0;
    totalMl = totalDrops / DROPS_PER_ML;

    filteredMlPerMin =
      EMA_ALPHA * mlPerMin +
      (1.0 - EMA_ALPHA) * filteredMlPerMin;

    updateLED(filteredMlPerMin);
    drawDisplay();
    printSerial();

    intervalDrops = 0;
    lastMeasureTime = now;
  }
}
