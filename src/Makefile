CC=g++
INC_FLAGS=/opt/rocm/opencl/include
LIB_DIR=/opt/rocm/opencl/lib/x86_64
LIB=OpenCL
CLANG=clang

ImageAddRGBA8:
	mkdir -p bin
	$(CC) -I$(INC_FLAGS) ImageAddRGBA8.cpp -L$(LIB_DIR) -l$(LIB) -o ./bin/ImageAddRGBA8

ImageAddRGBA16:
	mkdir -p bin
	$(CC) -I$(INC_FLAGS) ImageAddRGBA16.cpp -L$(LIB_DIR) -l$(LIB) -o ./bin/ImageAddRGBA16

image-cl:
	mkdir -p bin
	$(CLANG) -target amdgcn-amd-amdhsa-opencl -x cl -D__AMD__=1 -D__gfx803__=1 -D__gfx803=1 -D__OPENCL_VERSION__=200 -D__IMAGE_SUPPORT__=1 -O3 -m64 -include /opt/rocm/opencl/include/opencl-c.h image.cl 

clean:
	rm -rf ./bin
