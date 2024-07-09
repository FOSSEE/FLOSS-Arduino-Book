#include <esp_now.h>
#include <WiFi.h>
#include <OneWire.h>
#include <DallasTemperature.h>

// Data wire is connected to GPIO4
#define ONE_WIRE_BUS 4

// Setup a oneWire instance to communicate with any OneWire devices
OneWire oneWire(ONE_WIRE_BUS);

// Pass our oneWire reference to Dallas Temperature sensor
DallasTemperature sensors(&oneWire);

// Peer MAC Address - replace this with the MAC address of the receiver ESP32
uint8_t peerAddress[] = {0x08, 0xB6, 0x1F, 0x3B, 0x85, 0xFC}; // Correct MAC address format

typedef struct struct_message {
  float temperature;
} struct_message;

struct_message myData;

void setup() {
  // Initialize Serial Monitor
  Serial.begin(115200);
  
  // Initialize the DS18B20 sensor
  sensors.begin();

  // Set device as a Wi-Fi Station
  WiFi.mode(WIFI_STA);

  // Initialize ESP-NOW
  if (esp_now_init() != ESP_OK) {
    Serial.println("Error initializing ESP-NOW");
    return;
  }

  // Register peer
  esp_now_peer_info_t peerInfo;
  memset(&peerInfo, 0, sizeof(peerInfo)); // Clear peerInfo structure
  memcpy(peerInfo.peer_addr, peerAddress, 6);
  peerInfo.channel = 0;  
  peerInfo.encrypt = false;

  // Add peer
  if (esp_now_add_peer(&peerInfo) != ESP_OK) {
    Serial.println("Failed to add peer");
    return;
  }
}

void loop() {
  // Request temperature from DS18B20 sensor
  sensors.requestTemperatures();
  float temperature = sensors.getTempCByIndex(0);
  
  // Check if any reads failed
  if (temperature == DEVICE_DISCONNECTED_C) {
    Serial.println("Failed to read from DS18B20 sensor!");
    return;
  }

  // Prepare data to send
  myData.temperature = temperature;

  // Send message via ESP-NOW
  esp_err_t result = esp_now_send(peerAddress, (uint8_t *) &myData, sizeof(myData));

  if (result == ESP_OK) {
    Serial.print("Temperature sent: ");
    Serial.println(temperature);
  } else {
    Serial.println("Error sending the data");
  }

  delay(2000); // Send data every 2 seconds
}
