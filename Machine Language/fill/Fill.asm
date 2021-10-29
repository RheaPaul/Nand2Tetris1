// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@8192   // to find how many bytes are required:(512 * 32) / 16
        D=A
        @byteno
        M=D     // byteno = 8192 (# of bytes)
(LOOP)
        @addressno
        M=0     // makes addressno = 0
(FORINP)
        @KBD  //taking keyboard input
        D=M
        @WHITESCRN
        D;JEQ   // goto WHITE if KBD value is 0
(BLACKSCRN)
        @addressno
        D=M
        @SCREEN
        A=A+D   // Calculating the byte address
        M=-1    // Since key is pressed: Fill with black
        @END
        0;JMP   
(WHITESCRN)
        @addressno
        D=M
        @SCREEN
        A=A+D   // Calculating the byte address
        M=0     // since key is not pressed :Fill with white
(END)
        @addressno
        MD=M+1  // keep incrementing addressno by 1
        @byteno
        D=D-M
        @LOOP
        D;JEQ   // jumps LOOP if (addressno-byteno) == 0
        @FORINP
        0;JMP   // goto INNER