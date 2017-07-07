#pragma once

namespace stinger {

template<typename T>
struct Tensor{
public:
    T *ptr;
    size_t width, height, n;
    Tensor(size_t width, size_t height): 
        ptr(new T[width*height]), n(width*height), width(width), height(height) {}
    T* data() { return ptr; }
    T& operator[](size_t idx) { return ptr[idx]; }
    const T& operator[](size_t idx) const { return ptr[idx]; }
};

template<typename T>
void fill(Tensor<T>& t, T val) {
    for(size_t i=0;i<t.n;i++){
        t[i] = val;
    }
}

}
