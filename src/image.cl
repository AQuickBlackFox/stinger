__kernel void imageAdd(__read_only image2d_t input,
                    __write_only image2d_t output)        
{                                       
   int2 x2;
   x2.x = get_global_id(0);
   x2.y = 0; 
   float4 inp = read_imagef(input, x2); 
   write_imagef(output, x2, inp); 
}
