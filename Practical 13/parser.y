%{
    #include <stdio.h>
    int yylex();
    void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
input:
        |   input line
        ;
line:
            expr '\n'        { printf("Valid Expression!\n\n"); }
        ;
expr:   
            expr '+' expr
        |   expr '-' expr
        |   expr '*' expr
        |   expr '/' expr
        |   '(' expr ')'
        |   NUMBER
        ;
%%

void yyerror(const char *s) {
    printf("Invalid Expression!\n");
}

int main() {
    printf("Enter arithmetic expression:\n");
    yyparse();
    return 0;
}