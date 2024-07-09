import cv2
import os
import time

def capture_images_from_esp32(class_name, esp32_url, capture_duration=20, save_dir='/home/harsh/Desktop/Task2/new_data'):
    # Create the directory for the class if it doesn't exist
    class_dir = os.path.join(save_dir, class_name)
    os.makedirs(class_dir, exist_ok=True)

    # Start capturing images from ESP32-CAM
    cap = cv2.VideoCapture(esp32_url)
    if not cap.isOpened():
        print(f"Failed to open video stream at {esp32_url}")
        return

    start_time = time.time()
    img_count = 0

    while int(time.time() - start_time) < capture_duration:
        ret, frame = cap.read()
        if not ret:
            print("Failed to capture image from ESP32-CAM")
            break

        # Save the frame as an image file
        img_path = os.path.join(class_dir, f"{img_count}.jpg")
        cv2.imwrite(img_path, frame)
        img_count += 1

        # Display the frame (optional)
        cv2.imshow('Capturing', frame)

        # Press 'q' to quit early
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # Release the capture and close any OpenCV windows
    cap.release()
    cv2.destroyAllWindows()
    print(f"Captured {img_count} images for class '{class_name}'.")

if __name__ == "__main__":
    esp32_url = 'http://192.168.144.123:81/stream'  # Replace with your ESP32-CAM stream URL
    print(f"Trying to open video stream at {esp32_url}")

    while True:
        class_name = input("Which class are you going to capture? (leave empty to exit) ")
        if not class_name:
            print("Exiting...")
            break

        print(f"Starting capture for class: {class_name}")
        capture_images_from_esp32(class_name, esp32_url)
        print(f"Finished capturing images for class: {class_name}")
