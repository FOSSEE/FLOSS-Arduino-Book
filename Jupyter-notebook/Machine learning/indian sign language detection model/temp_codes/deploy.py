import cv2
import numpy as np
import tensorflow as tf

# Load the TFLite model
interpreter = tf.lite.Interpreter(model_path="/home/harsh/Desktop/Task2/temp_codes/tf_lite_quant_model.tflite")
interpreter.allocate_tensors()

# Get input and output tensors
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# Define the video capture object
vc = cv2.VideoCapture(0)

# Replace with your ESP32-CAM stream URL
# stream_url = 'http://192.168.129.123:81/stream'

# Open a connection to the IP camera using OpenCV VideoCapture
# vc = cv2.VideoCapture(stream_url)

# Loop until the user presses the 'q' key
while True:
    # Capture a frame from the webcam
    ret, frame = vc.read()
    if not ret:
        print("Failed to capture image")
        break

    # Convert the frame to grayscale
    gray_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Resize the frame to 40x40
    resized_frame = cv2.resize(gray_frame, (100, 100))

    # Normalize the pixel values
    normalized_frame = resized_frame / 127.5 - 1.0

    # Add a batch dimension and ensure it has the right shape
    input_data = np.expand_dims(normalized_frame, axis=(0, -1)).astype(np.float32)

    # Set the input tensor
    interpreter.set_tensor(input_details[0]['index'], input_data)

    # Run the interpreter
    interpreter.invoke()

    # Get the output tensor
    output_data = interpreter.get_tensor(output_details[0]['index'])

    # Get the predicted class
    predicted_class = np.argmax(output_data)

    if predicted_class == 1:
        predicted_gesture = "A"
    elif predicted_class == 2:
        predicted_gesture = "B"
    elif predicted_class == 3:
        predicted_gesture = "C"
    elif predicted_class == 4:
        predicted_gesture = "D"
    elif predicted_class == 5:
        predicted_gesture = "E"
    elif predicted_class == 6:
        predicted_gesture = "F"
    elif predicted_class == 7:
        predicted_gesture = "G"
    elif predicted_class == 8:
        predicted_gesture = "H"
    elif predicted_class == 9:
        predicted_gesture = "I"
    elif predicted_class == 10:
        predicted_gesture = "J"
    elif predicted_class == 11:
        predicted_gesture = "K"
    elif predicted_class == 12:
        predicted_gesture = "L"
    elif predicted_class == 13:
        predicted_gesture = "M"
    elif predicted_class == 14:
        predicted_gesture = "N"
    elif predicted_class == 15:
        predicted_gesture = "O"
    elif predicted_class == 16:
        predicted_gesture = "P"
    elif predicted_class == 17:
        predicted_gesture = "Q"
    elif predicted_class == 18:
        predicted_gesture = "R"
    elif predicted_class == 19:
        predicted_gesture = "S"
    elif predicted_class == 20:
        predicted_gesture = "T"
    elif predicted_class == 21:
        predicted_gesture = "U"
    elif predicted_class == 22:
        predicted_gesture = "V"
    elif predicted_class == 23:
        predicted_gesture = "W"
    elif predicted_class == 24:
        predicted_gesture = "X"
    elif predicted_class == 25:
        predicted_gesture = "Y"
    elif predicted_class == 26:
        predicted_gesture = "Z"
    elif predicted_class == 0:
        predicted_gesture = 'empty'

    # Print the predicted class
    print("Predicted gesture:", predicted_gesture)
    

    # Display the frame
    cv2.imshow('Webcam_Gesture_Recognition', gray_frame)

    # Press 'q' to exit
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the video capture object
vc.release()

# Close all windows
cv2.destroyAllWindows()
