#include <stdio.h>
#include <ctype.h>

void encode(const char *original, char *encoded){
	
	char *ptrO = &original[0]
	char *ptrE = &encoded[0]
	char prev=' '
	
	for(int i=0,*ptrO != '\',i++){
		if(prev == *ptr0 or prev==' '){
			prev=*ptr0
			} //Nombre de cops que es repeteix una lletra
		else if(i==1){
			*ptrE=prev
			*ptrE++
			}
		else{
			char str[4]
			sprintf(str,"%d",n)
			for(int i=0,i<4,i++){
				
				}
			}
		}
	}

void decode(const char *encoded, char *decoded)
{
// TODO
}

void main ( void )
{
const char original[100] = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB";
char encoded [100];
char decoded [100];
	
printf("Original:%snn", original);
encode(original, encoded);
printf("Encoded:%snn", encoded);
decode(encoded, decoded);
printf("Decoded :%snn", decoded);
}