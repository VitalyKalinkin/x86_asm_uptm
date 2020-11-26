#include <iostream>
#include <iomanip>
#include <array>
#include <stdlib.h>

extern "C" void reverse_array(int8_t* dst, const int8_t * src, int8_t n);

int main()
{
    constexpr size_t n = 10;
    std::array<int8_t, n> src_array, dst_array;

    for (size_t i = 0; i < n; i++) {
        src_array[i] = static_cast<int8_t>(i);
        dst_array[i] = 0;
    }

    reverse_array(dst_array.data(), src_array.data(), n);

    std::cout << "-------------Array Reverser------------\n";
    for (size_t i = 0; i < n; i++) {
        std::cout << "i: " << i
                  << ", src: " << static_cast<int16_t>(src_array[i])
                  << ", dst: " << static_cast<int16_t>(dst_array[i]) << std::endl;
    }

    return 0;
}
