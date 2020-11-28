// calculate_sum.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

extern "C" int32_t
adder_asm(int32_t a, int32_t b, int32_t c);

int32_t adder_cpp(int32_t a, int32_t b, int32_t c) {
    return a + b + c;
}

int main()
{
    std::cout << "C++: " << adder_cpp(17, 11, 14) << std::endl;
    std::cout << "ASM: " << adder_asm(17, 11, 14) << std::endl;
}
 