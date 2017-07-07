#include<iostream>
#include<cassert>
#include"DataTypes.h"

int main() {
    using namespace stinger;
    assert(sizeof(uint10_11_11_t)    == sizeof(unsigned int));
    assert(sizeof(uint11_11_10_t)    == sizeof(unsigned int));
    assert(sizeof(uint10_10_10_2_t)  == sizeof(unsigned int));
    assert(sizeof(uint2_10_10_10_t)  == sizeof(unsigned int));

    assert(sizeof(ushort5_6_5_t)    == sizeof(unsigned short));
    assert(sizeof(ushort1_5_5_5_t)  == sizeof(unsigned short));
    assert(sizeof(ushort5_5_5_1_t)  == sizeof(unsigned short));
    assert(sizeof(ushort4_4_4_4_t)  == sizeof(unsigned short));

    assert(sizeof(uint8_24_t) == sizeof(unsigned int));
    assert(sizeof(uint24_8_t) == sizeof(unsigned int));

}
