#include <stdio.h>
int main(){
	for(int i = 1; i<10; i++)
	{
		printf("tabuada de %d\n", i);
		for(int j = 1; j<=10; j++)
		{
			int num = i*j;
			printf("%d\n", num);
		}
	}
}
