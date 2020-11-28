#include <iostream>

extern "C" int32_t integer_mul_div(int32_t a, int32_t b, int32_t * prod, int32_t * quo, int32_t * rem);

int main()
{
    int32_t prod, quo, rem;
    int32_t ret = integer_mul_div(21, 9, &prod, &quo, &rem);
    std::cout << "Multiplication/Division: " << std::endl;
    std::cout << "  a * b = " << prod << std::endl;
    std::cout << "  a / b = " << quo << std::endl;
    std::cout << "  a % b = " << rem << std::endl;
    std::cout << "  ret = " << ret << std::endl;
}
