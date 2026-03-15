// Here I tried to match the colours of the LED to the measured state which should 
// also be displayed on the OLED monitor.


#include <Wire.h>

const byte SENSOR_PIN = 4;

const byte LED_R_PIN = 9;
const byte LED_G_PIN = 8;
const byte LED_B_PIN = 5;

const int DROP_ACTIVE_STATE = LOW;
const unsigned long MIN_DROP_GAP_MS = 40;
const unsigned long MEASURE_INTERVAL_MS = 1000;

const float DROPS_PER_ML = 20.0;
const float LOW_FLOW_ML_MIN  = 0.67;
const float HIGH_FLOW_ML_MIN = 2.00;

const bool COMMON_ANODE = false;

bool lastActiveState = false;

unsigned long totalDrops = 0;
unsigned long intervalDrops = 0;
unsigned long lastDropTime = 0;
unsigned long lastMeasureTime = 0;

float mlPerMin = 0.0;

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

void updateLED(float flowMlMin) {
  if (flowMlMin < LOW_FLOW_ML_MIN) {
    setRed();
  } else if (flowMlMin <= HIGH_FLOW_ML_MIN) {
    setGreen();
  } else {
    setBlue();
  }
}

void setup() {
  Serial.begin(9600);

  pinMode(SENSOR_PIN, INPUT_PULLUP);

  pinMode(LED_R_PIN, OUTPUT);
  pinMode(LED_G_PIN, OUTPUT);
  pinMode(LED_B_PIN, OUTPUT);

  setRGB(false, false, false);

  lastMeasureTime = millis();

  Serial.println("Drop detection with LED status started.");
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

  if (now - lastMeasureTime >= MEASURE_INTERVAL_MS) {
    float elapsedSec = (now - lastMeasureTime) / 1000.0;
    float mlPerSec = (intervalDrops / DROPS_PER_ML) / elapsedSec;
    mlPerMin = mlPerSec * 60.0;

    updateLED(mlPerMin);

    Serial.print("Drops total: ");
    Serial.print(totalDrops);
    Serial.print(" | Interval: ");
    Serial.print(intervalDrops);
    Serial.print(" | ml/min: ");
    Serial.println(mlPerMin, 2);

    intervalDrops = 0;
    lastMeasureTime = now;
  }
}
