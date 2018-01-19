CC=g++
INC_FLAGS=/opt/rocm/opencl/include
LIB_DIR=/opt/rocm/opencl/lib/x86_64
LIB=OpenCL
CLANG=clang

all: ImageAddRGBA8 ImageAddRGBA16


ImageAddRGB101010:
	mkdir -p bin
	$(CC) -I$(INC_FLAGS) -I../ -std=c++11 ImageAddRGB101010.cpp -L$(LIB_DIR) -l$(LIB) -o ./bin/ImageAddRGB101010

ImageAccum10:
	mkdir -p bin
	$(CC) -I$(INC_FLAGS) -I../ -std=c++11 ImageAccum10.cpp -L$(LIB_DIR) -l$(LIB) -o ./bin/ImageAccum10

ImageAccum32:
	mkdir -p bin
	$(CC) -I$(INC_FLAGS) -I../ -std=c++11 ImageAccum32.cpp -L$(LIB_DIR) -l$(LIB) -o ./bin/ImageAccum32

test:
	./bin/ImageAddRGB101010; ./bin/ImageAccum10

clean:
	rm -rf ./bin a.out

