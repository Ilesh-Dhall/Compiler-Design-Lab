%{
    #include <stdio.h>
%}

%%
\n                      { printf("\n"); }
[+-]?[0-9]+"."[0-9]+    { printf("Float: %s\n", yytext); }
[+-]?[0-9]+             { printf("Integer: %s\n", yytext); }
[ \t\n]                 ;
.                       ;
%%

int main()
{
    printf("Enter Input:\n");
    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}