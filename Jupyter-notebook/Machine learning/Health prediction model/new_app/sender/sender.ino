#include <esp_now.h>
#include <WiFi.h>
#include <DHT.h>

#define DHTPIN 4     // Pin connected to the DHT11 sensor
#define DHTTYPE DHT11   // DHT 11

DHT dht(DHTPIN, DHTTYPE);

// Peer MAC Address - replace this with the MAC address of the receiver ESP32
uint8_t peerAddress[] = {0x4C, 0x11, 0xAE, 0x9C, 0x19, 0xC4}; // Example MAC, replace with actual peer's MAC

typedef struct struct_message {
  float temperature;
} struct_message;

struct_message myData;

void setup() {
  // Initialize Serial Monitor
  Serial.begin(115200);
  
  // Initialize DHT sensor
  dht.begin();

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
  // Read temperature from DHT11 sensor
  float temperature = dht.readTemperature();
  
  // Check if any reads failed
  if (isnan(temperature)) {
    Serial.println("Failed to read from DHT sensor!");
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
