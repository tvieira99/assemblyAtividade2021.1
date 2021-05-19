#include <stdio.h>
int main()
{
	int num;
	scanf("%d", &num);
	for (int i = num-1; i>0 ; i--)
	{
		num = num * i;
	}
	printf("numero fatorial %d\n", num);
}
