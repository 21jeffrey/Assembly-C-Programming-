# Assembly-C-Programming-
A collection of small C and x86-64 NASM programs completed during class:

Factorial in C (iterative)

Sum of integers 15..25 in assembly (incrementing loop)

Sum of integers 25..15 in assembly (decrementing loop with dec)

Factorial implemented in assembly and called from C

Repo layout
factorial.c — C program for factorial (Q1)

sum_15_to_25.asm — Assembly: sum 15..25 (Q2)

sum_25_down_to_15.asm — Assembly: sum 25..15 using dec (Q3)

main_call_asm.c — C driver that calls the assembly factorial (Q4)

fact_asm.asm — Assembly implementation of factorial for Q4

README.md — This file



Q1: Factorial in C
Source: factorial.c

Build:

gcc -O2 -std=c11 -o factorial factorial.c

Run:

./factorial

Enter a non-negative integer when prompted.

Example:

Input: 5

Output: Factorial(5) = 120



Q2: Sum 15..25 in assembly (incrementing loop)
Source: sum_15_to_25.asm

Assemble and link (two-step):

nasm -felf64 sum_15_to_25.asm -o sum_15_to_25.o

ld -o sum_15_to_25 sum_15_to_25.o


Run:

./sum_15_to_25



Q3: Sum 25..15 in assembly (decrementing loop with dec)
Source: sum_25_down_to_15.asm

Assemble and link:

nasm -felf64 sum_25_down_to_15.asm -o sum_25_down_to_15.o

ld -o sum_25_down_to_15 sum_25_down_to_15.o



Run:

./sum_25_down_to_15




Q4: Factorial in assembly called from C
Files:

main_call_asm.c — declares and calls fact_asm

fact_asm.asm — implements fact_asm using System V AMD64 ABI

Build:

nasm -felf64 fact_asm.asm -o fact_asm.o

gcc -no-pie -O2 -o call_asm main_call_asm.c fact_asm.o

Run:

./call_asm

Enter n when prompted, result is printed.


Two files are used for this task: 1 C file (caller/printing) + 1 assembly file (factorial implementation).

Sample commands (copy-paste)
C factorial:

gcc -O2 -std=c11 -o factorial factorial.c

./factorial

Sum 15..25 (ASM):

nasm -felf64 sum_15_to_25.asm -o sum_15_to_25.o

ld -o sum_15_to_25 sum_15_to_25.o

./sum_15_to_25

Sum 25..15 (ASM):

nasm -felf64 sum_25_to_15.asm -o sum_25_to_15.o

ld -o sum_25_to_15 sum_25_to_15.o

./sum_25_down_to_15

C calls ASM factorial:

nasm -felf64 fact_asm.asm -o fact_asm.o

gcc -no-pie -O2 -o call_asm main_call_asm.c fact_asm.o

./call_asm