
#include <iostream>

extern "C" int32_t calculate_sums(int32_t a, int32_t b, int32_t c, int32_t* sum, int32_t* sum_squares, int32_t* sum_cubes);

int main()
{
    int32_t sum, sum_squares, sum_cubes;
    calculate_sums(2, 3, 4, &sum, &sum_squares, &sum_cubes);
    std::cout << "Sums: \n";
    std::cout << "a + b + c = " << sum << std::endl;
    std::cout << "a^2 + b^2 + c^2 = " << sum_squares << std::endl;
    std::cout << "a^3 + b^3 + c^3 = " << sum_cubes << std::endl;
}
