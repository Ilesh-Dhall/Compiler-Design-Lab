%{
    #include <stdio.h>
    #include <string.h>

    char valid[1000] = "";
%}

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"   ;
[a-zA-Z_][a-zA-Z0-9_]*    { strcat(valid, yytext); strcat(valid, " "); }
.|\n                      ;
%%

int main()
{
    printf("Enter text:\n");
    yylex();
    printf("\nValid Identifiers: %s\n", valid);

    return 0;
}

int yywrap()
{
    return 1;
}