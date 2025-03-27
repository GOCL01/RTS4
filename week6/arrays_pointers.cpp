#include <iostream>
using namespace std;


// Function to find the sum of the array elements
void sumArray(int* arr, int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += *(arr + i) ;  // Accessing array elements using pointers
    }
    cout << "Sum is : " << sum << "\n";
}

int main() {
    int arr[] = {1, 2, 3, 4, 5};  // Array initialization
    int size = sizeof(arr) / sizeof(arr[0]);  // Calculate the size of the array

    // Using pointer to access and modify array elements
    int* ptr = &arr[0];  // Pointer pointing to the first element of the array
    *(ptr + 2) = 10;  // Modify the third element (index 2) using pointer
    
    cout << "Array index 2 is :" << arr[2] << endl;
    
    

    // Call sumArray function
    sumArray(&arr[0], size);
    
 
    



    return 0;
}
