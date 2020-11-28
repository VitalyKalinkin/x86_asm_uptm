#include <iostream>

extern "C" int32_t memory_addressing(int32_t i, int32_t* v1, int32_t* v2, int32_t* v3, int32_t* v4, int32_t* v5);
extern "C" int32_t num_fib_vals;

int main()
{
    int32_t v1, v2, v3, v4, v5;
    for (size_t i = 0; i <= static_cast<size_t>(num_fib_vals); i++) {
        int32_t ret = memory_addressing(i, &v1, &v2, &v3, &v4, &v5);
        std::cout << "ret = " << ret
            << ", i=" << i
            << ", v1=" << v1
            << ", v2=" << v2
            << ", v3=" << v3
            << ", v4=" << v4
            << ", v5=" << v5 << std::endl;
    }
    return 0;
}
