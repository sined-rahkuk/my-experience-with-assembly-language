#include <stdio.h>

int arr[] = {64, 34, 25, 12, 22, 11, 90};
int size = sizeof(arr);
// A function to implement bubble sort
void bubbleSort()
{
  
  for (int i = size; i > 0; i--)

    // Last i elements are already in place
    for (int j = 0; j < i; j++)
    {
      if (arr[j + 1] >= arr[j])
        continue;

      int tmp = arr[j];
      arr[j] = arr[j + 1];
      arr[j + 1] = tmp;
    }
}

int main()
{

  // bubbleSort();

  for (int i = 0; i < size -1; i++) {
    printf("%d ", arr[i]);
  }

  return 0;
}
