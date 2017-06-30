#include"/opt/rocm/opencl/include/opencl-c.h"

__kernel void imageAdd(image2d_t input,
                    image2d_t output)        
{                                       
   int x = get_global_id(0);
   float4 inp = read_imagef(input, int2(x, 0)); 
   write_imagef(output, int2(x, 0), inp); 
}
