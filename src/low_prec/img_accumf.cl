__constant sampler_t sampler =
  CLK_NORMALIZED_COORDS_FALSE
| CLK_ADDRESS_CLAMP_TO_EDGE
| CLK_FILTER_NEAREST;


__kernel void Filter (
    __read_only image2d_t a,
    __read_only image2d_t b,
    __write_only image2d_t output)
{

    const int2 pos = {get_global_id(0), get_global_id(1)};

    float4 sum = read_imagef(a, sampler, pos) + read_imagef(b, sampler, pos);

    sum.x = sum.x + sum.y + sum.z;

    write_imagef (output, pos, sum.z);
}
