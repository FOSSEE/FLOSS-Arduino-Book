#include <esp_now.h>
#include <WiFi.h>

typedef struct struct_message {
  float temperature;
} struct_message;

struct_message myData;

float temperature = 0.0;  // Variable to store the received temperature

// Callback when data is received
void OnDataRecv(const esp_now_recv_info *info, const uint8_t *incomingData, int len) {
  memcpy(&myData, incomingData, sizeof(myData));
  temperature = myData.temperature;  // Store the received temperature in the variable
}

void setup() {
  // Initialize Serial Monitor
  Serial.begin(115200);
  
  // Set device as a Wi-Fi Station
  WiFi.mode(WIFI_STA);

  // Initialize ESP-NOW
  if (esp_now_init() != ESP_OK) {
    Serial.println("Error initializing ESP-NOW");
    return;
  }

  // Register receive callback
  esp_now_register_recv_cb(OnDataRecv);
}

void loop() {
  // Print the stored temperature every second
  Serial.print("Temperature: ");
  Serial.println(temperature);
  delay(1000);  // Delay for 1 second
}
