#include <Wire.h>
#include "MAX30105.h"
#include "heartRate.h"
#include <esp_now.h>
#include <WiFi.h>

MAX30105 particleSensor;

float beatsPerMinute;
float SpO2Value; // Variable to store SpO2 value
long lastBeat = 0; // Time at which the last beat occurred

// Peer MAC Address - replace this with the MAC address of the sender ESP32
uint8_t peerAddress[] = {0x30, 0xAE, 0xA4, 0x47, 0x73, 0x1C}; // Example MAC, replace with actual peer's MAC

typedef struct struct_message {
  float temperature;
} struct_message;

struct_message incomingData;

void onDataReceive(const uint8_t * mac, const uint8_t *data, int len) {
  memcpy(&incomingData, data, sizeof(incomingData));
  Serial.print("Temperature received: ");
  Serial.println(incomingData.temperature);
}

void setup()
{
  Serial.begin(115200);
  Serial.println("Initializing...");

  // Initialize sensor
  if (!particleSensor.begin(Wire, I2C_SPEED_FAST)) //Use default I2C port, 400kHz speed
  {
    Serial.println("MAX30105 was not found. Please check wiring/power. ");
    while (1);
  }
  Serial.println("Place your index finger on the sensor with steady pressure.");

  particleSensor.setup(); //Configure sensor with default settings
  particleSensor.setPulseAmplitudeRed(0x0A); //Turn Red LED to low to indicate sensor is running
  particleSensor.setPulseAmplitudeGreen(0); //Turn off Green LED

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

  // Register for a callback function that will be called when data is received
  esp_now_register_recv_cb(onDataReceive);
}

void loop()
{
  long irValue = particleSensor.getIR();
  long redValue = particleSensor.getRed();

  if (checkForBeat(irValue) == true)
  {
    // We sensed a beat!
    long delta = millis() - lastBeat;
    lastBeat = millis();

    beatsPerMinute = 60 / (delta / 1000.0);
  }

  // Calculate SpO2 value based on IR and Red readings
  // You can use your own algorithm or a library to calculate SpO2
  SpO2Value = calculateSpO2(irValue, redValue); // Placeholder function

  // Print all values to Serial
  Serial.print("IR=");
  Serial.print(irValue);
  Serial.print(", Red=");
  Serial.print(redValue);
  Serial.print(", BPM=");
  Serial.print(beatsPerMinute);
  Serial.print(", SpO2=");
  Serial.print(SpO2Value);
  Serial.print(", Temperature=");
  Serial.print(incomingData.temperature);

  if (irValue < 50000)
    Serial.print(" No finger?");

  Serial.println();

  delay(2000); // Update every 2 seconds
}

// Placeholder function for SpO2 calculation
float calculateSpO2(long irValue, long redValue)
{
  // Implement SpO2 calculation algorithm here
  // For demonstration, return a dummy value
  return 98.0; // Replace with actual calculation
}
