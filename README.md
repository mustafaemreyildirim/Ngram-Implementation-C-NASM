## AIM OF THE PROJECT
* This project aims to demonstrate the implementation of Ngram algorithm with given input argument.

## FILE FORMAT
* Input file format should be in "<n_gram_size> <string1> <string2>" format in each line. 

## INCLUDED FILES
* A main driver c file and an nasm implementation of n_gram function

## LINKING AND COMPLING
* nasm -f elf32 -g ngram.asm&&gcc -c -g NGRAM_MAIN.c&&gcc -g ngram.o NGRAM_MAIN.o -o total&&./total <arg>
