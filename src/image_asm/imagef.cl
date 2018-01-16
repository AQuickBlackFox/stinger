
__kernel void Filter (
    __read_only image2d_t a,
    __read_only image2d_t b,
    __write_only image2d_t output)
{

    const int2 pos = {get_global_id(0), get_global_id(1)};

    float4 sum = read_imagef(a, pos) + read_imagef(b, pos);

    write_imagef (output, pos, sum);
}
