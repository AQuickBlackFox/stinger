__constant sampler_t sampler =
    CLK_NORMALIZED_COORDS_FALSE 
    | CLK_ADDRESS_CLAMP_TO_EDGE
    | CLK_FILTER_NEAREST;

__kernel void sGemm(const int M, const in N, const int K,
                    __read_only image1d_t A,
                    __read_only image1d_t B,
                    image2d_t C) {
    const int row = get_local_id(0);
    const int col = get_local_id(1);
    const int globalRow = TS * get_group_id(0) + row;
    const int globalCol = TS * get_group_id(1) + col;

    __local float sA[TS][TS];
    __local float sB[TS][TS];

    float acc[WPT];
    for(int w = 0; w < WPT; w++) {
        acc[w] = 0.0f;
    }

    const int numTiles = K / TS;

    for(int t=0;t<numTiles;t++) {
        for(int w=0;w<WPT;w++) {
            const int tiledRow = TS * t + row;
            const int tiledCol = TS * t + col;
            float4 a, b;
            a = read_imagef(A, (tiledCol + w*RTS)*M + globalRow);
            b = read_imagef(B, (globalCol + w*RTS)*K + tiledRow);
            sA[col + w*RTS][row] = a.x;
            sB[col + w*RTS][row] = b.x;
        }

        barrier(CLK_LOCAL_MEM_FENCE);

        for(int k=0;k<TS;k++) {
            for(int w=0;w<WPT;w++) {
                acc[w] += sA[k][row] * sB[col +w*RTS][k];
            }
        }

        barrier(CLK_LOCAL_MEM_FENCE);
    }

    for(int w = 0; w < WPT; w++) {
        write_imagef(C, (globalCol + w*RTS)*M + globalRow, float4(acc[w]));
//        C[(globalCol + w*RTS)*M + globalRow] = acc[w];
    }
}
