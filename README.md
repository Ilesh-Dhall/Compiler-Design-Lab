# Compiler Design Lab Implementations 

## Course Code : PCS 601

1. Design a LEX Code to count the number of lines, space, tab-meta character and rest of characters in a given input pattern.

2. Design a LEX Code to identify and print valid identifier of C/C++ in a given input pattern.

3. Design a LEX Code to identify and print integer and float value in a given input pattern.

4. Design a LEX Code for tokenizing (Identify and print OPERATORS, SEPERATORS, KEYWORDS, IDENTIFERS) the following C-fragment:

    ```c
    int p=1, d=0,r=4; float m=0.0, n=200.0;
    while (p <= 3)
    { if(d==0)
    { m= m+n*r+4.5; d++; }
    else
    { r++; m=m+r+1000.0; } p++; }
    ```

5. Design a LEX Code to count and print the total number of characters, words, white spaces and lines in a given file named as ‘Input.txt’.

6. Design a LEX Code to replace all the white spaces of ‘Input.txt’ file by a single blank character and store the output in ‘Output.txt’ file.

7. Design a LEX Code to remove the comments from any C-Program (in.c ) given at run-time and store into ‘out.c’ file.

8. Design a LEX Code to extract all html tags in the HTML file given at run time and store into text file given at run time.

9. Design a DFA in LEX Code which accepts string containing even number of ‘a’ and even number of ‘b’ over the input alphabet {a, b}.

10. Design a DFA in LEX Code which accepts string containing third last element ‘a’ over the input alphabet {a, b}.

11. Design a DFA in LEX Code to identify and print integer & float constants and identifier.

12. Design YACC/LEX code to recognize the valid string from the language L= {anbn | n>=1}.

13. Design YACC/LEX code to recognize valid arithmetic expression with operators +, -, * and /.

14. Design YACC/LEX code to evaluate the arithmetic expression involving operators +, -, * and / with operator precedence grammar.