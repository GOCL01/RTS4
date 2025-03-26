/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <stdio.h>

int swap_v1(unsigned char val1, unsigned char val2)
{
    unsigned char temp = val1;
    val1 = val2;
    val2 = temp;
    return 0;
}

int swap_v2(unsigned char *val1, unsigned char *val2)
{
    unsigned char temp = *val1;
    *val1 = *val2;
    *val2 = temp;
    return 0;
}

int main()
{
    unsigned char letterA = 'A';
    unsigned char letterB = 'B';
    
    printf("Before swap...\n");
    printf("letterA = %c\n", letterA);
    printf("letterB = %c\n", letterB);
    
    swap_v1(letterA, letterB);

    printf("After swap...\n");
    printf("letterA = %c\n", letterA);
    printf("letterB = %c\n", letterB);

    swap_v2(&letterA, &letterB);

    printf("After swap...\n");
    printf("letterA = %c\n", letterA);
    printf("letterB = %c\n", letterB);
  
    return 0;
}

