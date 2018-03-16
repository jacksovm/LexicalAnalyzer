# Information about LexicalAnalyzer assignment
CSCI 530 Assignment 01
Consider the following simple programming language called TinyLang.  
TinyLang has the following types of tokens:
Token Type	Description

IDENT_OR_KEY	A letter (A-Z or a-z) or an underscore followed by 0 or more letters,   digits, or underscores

S_LITERAL	A double quote ("), followed by zero or more occurrences of either:
    (1) a non-double quote character or 
    (2) a backslash (\) followed by a double quote.

The string literal must end in a double quote. 

**Note:** To eliminate some complexity, we will assume there are no spaces in the string literals. (You do not have to code for this, we will just make that assumption).

I_LITERAL	A sequence of digits (0-9)
OP_PLUS	The '+' character
OP_MINUS	The '-' character
OP_MULT	The '*' character
OP_DIV	The '/' character
OP_EQ	The ‘=’ character
L_PAREN	The '(' character
R_PAREN	The ')' character
SEMI	The ‘;’ character

Using the tokens defined for TinyLang, you will write a lexical analyzer in perl. In your program, you must use two arrays. One to hold the regular expressions for each token, and one for the name of the Token type. Given a file with code written in TinyLang, your lexical analyzer must identify and print the name of each token in the file. If a token appears that is not valid, your program must print UNDEFINED.

To submit the project, you must hand in your .pl file to Blackboard. I have included a folder of sample input and output your program should give. Please rename the perl file to YourLastNameAssign01.pl. You will lose points if your file does not have a proper name. Also, before you hand it in, please make sure that the input file that your program is looking for is in1.tinyl and is pulling from the same directory as your code file.  Your output should be set up to print to out1.txt. Not having to change filenames in your code will help speed up grading 

Also, you do not need to line everything up perfectly in the output. Just separate the token and token name with one space. 
AND... most importantly... HAVE FUN!! I KNOW I DID!!! 

**Note**: The L_PAREN, R_PAREN, and SEMI will be the most “fun”  One hint that can save you a lot of time is the split function in perl allows more than one delimiter. It also allows you to keep the delimiter as a part of the resulting array if you choose.

