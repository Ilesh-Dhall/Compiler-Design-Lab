%{
    #include <stdio.h>
    #include <stdlib.h>

    void yyerror(const char *s);
    int yylex(void);
%}

%token A B

%%
S   :    A S B
    |    A B
    ;
%%

void yyerror(const char *s) {
    printf("Invalid String: Does NOTE belong to L = {a^nb^n}\n");
}

int main() {
    printf("Enter string (only a and b): \n");
    if (yyparse() == 0) {
        printf("Valid String: Belongs to L = {a^nb^n}\n");
    }
}