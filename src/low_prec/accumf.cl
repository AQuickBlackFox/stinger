__constant sampler_t sampler =
 CLK_NORMALIZED_COORDS_FALSE
| CLK_ADDRESS_CLAMP_TO_EDGE
| CLK_FILTER_NEAREST;

__kernel void Filter(
    __read_only image1d_t a,
    __read_only image1d_t b,
    __write_only image1d_t c) {
    if(get_global_id(0) == 0) {
        float4 val = {0.0f, 0.0f, 0.0f, 0.0f};
        float sum = 0.0f;
        int i=0;
        for(;i<64;i++) {
            val = read_imagef(a, sampler, i);
            sum = val.x + val.y + val.z + sum;
        }
        float4 out = {sum, 0, 0, 0};
        write_imagef(c, 0, out);
    }
}
