// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R2
    M=0
    @product
    M=0
    @R0
    D=M
    
    @FORNEGATIVE //to include both negative numbers,
    0;JMP       // we convert both negative to positive
(JUMPTO)
    @product
    D=M
    @R1
    D=D-M
    @END
    D;JGE

(LOOP) // loop that sums R0 to result R1 times
    @R0
    D=M
    @R2
    M=D+M
    @product
    M=M+1
    
    @product
    D=M
    @R1
    D=D-M
    @LOOP
    D;JLT
(END)
    @END
    0;JMP

// Negative numbers workaround
(FORNEGATIVE)
    @R1
    D=M
    @JUMPTO
    D;JGE // if we get R1 >= 0, jump to JUMPTO

    @R0
    M=!M
    M=M+1
    @R1
    M=!M
    M=M+1
    @JUMPTO
    0;JMP
