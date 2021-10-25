#include <stdio.h>
unsigned char Number=200; /*write here the number and the mask */
unsigned char Mask=0x0F;

int hm_ones(unsigned char Num,unsigned char Mask){
	unsigned char resul=0;
	Num=Num&Mask;
	
	int i;
	for (i=0;i<8;i++){
		if(Num&1==1)
			resul++;
		Num=Num>>1;
		}
	
	return(resul);
	}

int main(void){
	int resul=hm_ones(Number,Mask);
	printf("%d",resul);
	return 0;
}