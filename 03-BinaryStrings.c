#include <stdio.h>
#define MAXN 100
int a[MAXN],c,n,f;
char b[MAXN+1];
void normal_order()
{
	printf("{}, ");
	while(1)
	{
		for(c=0;b[c]--;c++); b[c]+=2;
		if(c==n) break;
		putchar('{'); for(;c<n;c++) if(b[c]) printf("%d,",a[c]); printf("\b}, ");
	}
	printf("\b\b ");
}
void squashed_order()
{
	putchar('{'); for(c=0;c<n;c++) printf("%d,",a[c]); printf("\b}, ");
	while(1)
	{
		putchar('{'); f=1; for(c=0;b[c]--;c++) {printf("%d,",a[c]); f=0;} b[c]+=2;
		for(;c<n;c++) if(!b[c]) {printf("%d,",a[c]); f=0;} printf("\b}, ");
		if(f) break;
	}
	printf("\b\b\b{}");
}
void gray_order()
{
	printf("{}, ");
	while(1)
	{
		for(c=0;b[c]--;c++); b[c]+=2;
		if(c==n) break;
		if(--c<0) c++;
		putchar('{'); for(;c<n;c++) if(b[c]^b[c+1]) printf("%d,",a[c]); printf("\b}, ");
	}
	printf("\b\b ");
}
int main()
{
	printf("Enter number of elements: "); scanf("%d",&n);
	printf("Enter elements: "); for(int c=0;c<n;c++) b[c]=scanf("%d",&a[c])-1; b[n]=0;
	printf("Normal order   : "); normal_order(); for(int c=0;c<=n;c++) b[c]=0;
	printf("\nSquashed order : "); squashed_order(); for(int c=0;c<=n;c++) b[c]=0;
	printf("\nGray order     : "); gray_order();
	return 0;
}

