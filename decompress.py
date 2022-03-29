from lz4 import block
import sys
import json
import ast

# decompresse lz4 to byte stream
def lz4_to_binary(filepath):
    bytestream = open(filepath, "rb")
    bytestream.read(8)  # skip past the b"mozLz40\0" header
    valid_bytes = bytestream.read()
    binary = block.decompress(valid_bytes)
    return binary

# write byte stream to json file
def binary_to_json(input, output, pretty=False):
    binary = lz4_to_binary(input)
    if pretty == True:
        f = open(output, 'w')
        d = ast.literal_eval(binary.decode("utf-8"))
        f.write(json.dumps(d, indent=2))
    if pretty == False:    
        f = open(output, 'wb')
        f.write(binary)

def main():
    binary_to_json(sys.argv[1], sys.argv[2])

if __name__ == "__main__":
    main()

