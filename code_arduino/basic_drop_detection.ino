// This was one of my first tries to use the IR beam sensor to detect something
// in a given time frame and then also produce output out of the signal. 


#include <Wire.h>

const byte SENSOR_PIN = 4;
const int DROP_ACTIVE_STATE = LOW;
const unsigned long MIN_DROP_GAP_MS = 40;

bool lastActiveState = false;
unsigned long totalDrops = 0;
unsigned long lastDropTime = 0;

void setup() {
  Serial.begin(9600);
  pinMode(SENSOR_PIN, INPUT_PULLUP);
  Serial.println("Basic drop detection started.");
}

void loop() {
  unsigned long now = millis();
  bool activeNow = (digitalRead(SENSOR_PIN) == DROP_ACTIVE_STATE);

  // Count only on edge: inactive -> active
  if (activeNow && !lastActiveState) {
    if (now - lastDropTime >= MIN_DROP_GAP_MS) {
      totalDrops++;
      lastDropTime = now;

      Serial.print("Drop detected! Total count: ");
      Serial.println(totalDrops);
    }
  }

  lastActiveState = activeNow;
}
