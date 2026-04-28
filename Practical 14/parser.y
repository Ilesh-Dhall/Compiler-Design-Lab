%{
    #include <stdio.h>
    #include <stdlib.h>
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
            expr '\n'        { printf("Valid Expression. Result = %d\n\n", $1); }
        ;
expr:   
            expr '+' expr    { $$ = $1 + $3; }
        |   expr '-' expr    { $$ = $1 - $3; }
        |   expr '*' expr    { $$ = $1 * $3; }
        |   expr '/' expr    { if ($3 == 0) { printf("Error: Division by zero\n"); exit(1); } $$ = $1 / $3; }
        |   '(' expr ')'     { $$ = $2; }
        |   NUMBER           { $$ = $1; }
        ;
%%

void yyerror(const char *s) {
    printf("Invalid Expression\n");
}

int main() {
    printf("Enter arithmetic expression:\n");
    yyparse();
    return 0;
}