/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <iostream>

int main()
{
    int num = 10;
    
    
    std::cout << "New value of num : "  << num << "\n";
    std::cout << "Address of num : "  << &num << "\n";
    
    int *ptr = &num;  // Declaring a pointer ptr of a int variab
    
    //ptr = &num;// ptr stores the address of num (int)
                 // This would be equivalent to int *ptr = &num
    
    std::cout << "num address : " << ptr << "\n";
    std::cout << "Accessing value by address : " << *ptr << "\n";
    
    // Accessing through pointer
    
    *ptr = 20;
    std::cout << "New value of num : " << num << "\n";
    
    

    return 0;
}
