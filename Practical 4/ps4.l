%{
    #include <stdio.h>
%}

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"   { printf("KEYWORD: %s\n", yytext); }
"+"|"-"|"*"|"/"|"%"|"&"|"|"|"^"|"~"|"!"|"<"|">"|"="|"?"|":"|"."|"+="|"-="|"*="|"/="|"%="|"&="|"^="|"|="|">>"|"<<"|"++"|"--"|"->"|"&&"|"||"|"<="|">="|"=="|"!="|">>="|"<<="     { printf("OPERATOR: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*    { printf("IDENTIFIER: %s\n", yytext); }
[(),;{}]                  { printf("SEPARATOR: %s\n", yytext); }
[ \t\n]                   ;
.                         ;
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