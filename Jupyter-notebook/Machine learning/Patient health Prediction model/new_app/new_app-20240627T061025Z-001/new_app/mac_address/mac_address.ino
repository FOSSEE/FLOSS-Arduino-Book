#include <WiFi.h>
//08:B6:1F:3B:85:FC esp32 
// 30:AE:A4:47:73:1C esp32 lolin 

void setup() {
  Serial.begin(115200);
  WiFi.mode(WIFI_STA);
  Serial.print("MAC Address: ");
  Serial.println(WiFi.macAddress());
}

void loop() {
}
