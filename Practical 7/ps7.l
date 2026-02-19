%{
    #include <stdio.h> 
    extern FILE *yyin, *yyout;
%}

%%
"//".*             ;
"/*"(.|\n)*"*/"    ;
.|\n               { putc(yytext[0], yyout); }
%%

int main()
{
    yyin = fopen("in.c", "r");
    yyout = fopen("out.c", "w");

    if(yyin == NULL || yyout == NULL)
    {
        printf("Invalid File!\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    printf("Comments removed successfully.\n");
    printf("Output stored in out.c\n");
    
    return 0;
}

int yywrap()
{
    return 1;
}