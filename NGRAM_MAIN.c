#include <stdio.h>
#include <string.h>

int n_gram(char* str_1, int size_1, char* str_2, int size_2, int n);
int main(int argc, char **argv)
{
    FILE *fptr;
    char first_word[50], second_word[50];
    int length=-1;
    fptr = fopen(argv[1],"rb");

    if(fptr == NULL)
    {
        printf("Error!");   
        return 0;         
    }

    while(!feof (fptr)){
        if(length!=-1){
            printf("%d\n", n_gram(first_word, strlen(first_word), second_word, strlen(second_word), length));
        }
        fscanf (fptr, "%d %s %s", &length, first_word, second_word);
    }

    return 0;
}