%{
    #include <stdio.h> 
    extern FILE *yyin, *yyout;
%}

%%
"//".*                       ;
"/*"([^*]|\*+[^*/])*\*+"/"   ; 
.|\n                         { putc(yytext[0], yyout); }
%%

int main(int argc, char *agrv[])
{
    yyin = fopen(argv[1], "r");
    yyout = fopen("out.c", "w");

    if(yyin == NULL)
    {
        printf("Error opening input file!\n");
        return 1;
    }

    if(yyout == NULL)
    {
        printf("Error opening output file!\n");
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