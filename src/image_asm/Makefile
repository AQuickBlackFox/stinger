CC=g++
INC_FLAGS=/opt/rocm/opencl/include
LIB_DIR=/opt/rocm/opencl/lib/x86_64
LIB=OpenCL
CLANG=clang

fadd:
	mkdir -p bin
	$(CC) -I$(INC_FLAGS) fadd.cpp -L$(LIB_DIR) -l$(LIB) -o ./bin/fadd

fadd_asm:
	mkdir -p bin
	$(CC) -I$(INC_FLAGS) fadd_asm.cpp -L$(LIB_DIR) -l$(LIB) -o ./bin/fadd_asm

clean:
	rm -rf ./bin a.out

