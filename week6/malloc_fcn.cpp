/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <stdlib.h>
#include <stdlib.h>
#include <cstdio>

int main()
{
    unsigned int arraySize;
    float* pArray;

    printf("Provide array elements count: ");
    // Read the number of elements (size) of the array from user input
    scanf("%d", &arraySize);
    


    // Dynamically allocate memory for the array of 'arraySize' elements
    // We use sizeof(float) to allocate the memory size for each element of the array
    //void* is a pointer to void.
    //The void* type is a special kind of pointer that can point to any data type. It is a "generic" pointer type.
    pArray = (float*)malloc(arraySize * sizeof(float));

    if(pArray != NULL){
        for(int idx = 0; idx < arraySize; idx++)
            {
                pArray[idx] = idx/10.0;
            }
        
                for(int idx = 0; idx < arraySize;idx++)
            {
                printf("%f, ", pArray[idx]);
            }
                free(pArray);
            
        
    }

return 0;}
