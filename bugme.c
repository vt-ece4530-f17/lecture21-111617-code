#include <stdio.h>

int sumthislist(int *list, int n) {
  int i, j;
  for (i=0; i<=n; i++)
    j += list[i];
  return j;
}

int main() {

  int list[10];
  int i;

  for (i=0; i<10; i++)
    list[i] = i;

  printf("%d\n", sumthislist(list,10));

  return 0;  
}
