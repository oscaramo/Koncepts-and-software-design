#include <stdio.h>
#include <stdlib.h>
#define FILTER_ORDER 3


//Computes the value  of Y for given X and previous Y
void filter(double *Y,double *X, int i){
	float A[FILTER_ORDER+1]={1.0,-2.38124815209711,1.93969852431413,-0.535986990176121};
    float B[FILTER_ORDER+1] = {0.00280792275511279,0.00842376826533838,0.00842376826533838,0.00280792275511279};
	
	//Y[i] is the actual output of the filter X[i] is the input
	Y[i]+=B[0]*X[i];
	int num;
	if(i<FILTER_ORDER+1){	//if there are less X values than the order of the filter+1
		for(num=1;num<i;num++){
			Y[i]+=B[num]*X[i-num]-A[num]*Y[i-num];
			}
		}
	else{					//when there are enough X values
		for(num=1;num<FILTER_ORDER+1;num++){
			Y[i]+=B[num]*X[i-num]-A[num]*Y[i-num];
			}		
		}
	}


int main(void){
	double X[301];
	double Y[301]={0};
	
	char buffer[16];
	
	
	//Reads X file and assign the values to X
	FILE *fp=fopen("x_signal.csv","r");
	int index=0;
	char *success;
	
	while((success=fgets(buffer,16,fp))!=NULL){
		X[index]=atof(buffer);
		index++;
		};
	fclose(fp);
	
	//Compute Y values
	int length=index;
	
	for(index=0;index<length;index++){
		filter(Y,X,index);
		}
	
	
	//Write the filtered signal Y to a csv file
	FILE *fp2=fopen("y_signal.csv","w");
	for(index=0;index<length;index++){
		fprintf(fp2,"%f\n",Y[index]);
		}
	fclose(fp2);
	
	
	return 0;
}