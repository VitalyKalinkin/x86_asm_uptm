#include <iostream>
#include <iomanip>

extern "C" int8_t gl_char = 10;
extern "C" int16_t gl_short = 20;
extern "C" int32_t gl_int = 30;
extern "C" int64_t gl_long = 0x00000000FFFFFFFF;

extern "C" void integer_addition(int8_t a, int16_t b, int32_t c, int64_t d);

int main()
{
    std::cout << "gl_char = " << +gl_char
        << ", gl_short = " << gl_short
        << ", gl_int = " << gl_int
        << ", gl_long = " << gl_long << std::endl;
    integer_addition(3, 5, -37, 11);
    std::cout << "gl_char = " << +gl_char
        << ", gl_short = " << gl_short
        << ", gl_int = " << gl_int
        << ", gl_long = " << gl_long << std::endl;
    integer_addition(1, 2, 3, 0x0000000FFFFFFFFF);
    std::cout << "gl_char = " << +gl_char
        << ", gl_short = " << gl_short
        << ", gl_int = " << gl_int
        << ", gl_long = " << std::hex << gl_long << std::endl;
}
