CC=g++
INC_FLAGS=/opt/rocm/opencl/include
LIB_DIR=/opt/rocm/opencl/lib/x86_64
LIB=OpenCL
CLANG=clang

image:
	mkdir -p bin
	$(CC) -I$(INC_FLAGS) image8bit.cpp -L$(LIB_DIR) -l$(LIB) -o ./bin/image

image-cl:
	mkdir -p bin
	$(CLANG) -target amdgcn-amd-amdhsa-opencl -x cl -D__AMD__=1 -D__gfx803__=1 -D__gfx803=1 -D__OPENCL_VERSION__=120 -D__IMAGE_SUPPORT__=1 -O3 -m64 -include /opt/rocm/opencl/include/opencl-c.h image.cl 

clean:
	rm -rf ./bin
