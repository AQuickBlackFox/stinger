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

    uint4 sum = read_imageui(a, sampler, pos) + read_imageui(b, sampler, pos);

    write_imageui(output, pos, sum);
}
