def convert_to_c_array(model_path, output_path):
    with open(model_path, 'rb') as model_file:
        model_data = model_file.read()

    with open(output_path, 'w') as c_array_file:
        c_array_file.write('#include "model_data.h"\n\n')
        c_array_file.write('const unsigned char model_tflite[] = {\n')
        
        for i, byte in enumerate(model_data):
            if i % 12 == 0:
                c_array_file.write('\n')
            c_array_file.write(f'0x{byte:02x}, ')
        
        c_array_file.write('\n};\n')
        c_array_file.write(f'const unsigned int model_tflite_len = {len(model_data)};\n')

if __name__ == '__main__':
    convert_to_c_array('sign_language_model.h5', 'model_data.cc')
