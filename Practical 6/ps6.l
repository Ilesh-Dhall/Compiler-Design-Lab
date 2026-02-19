%{
    #include <stdio.h>
    extern FILE *yyin, *yyout;
%}

%%
[ \t\n]+    { fputc(' ', yyout); }
.           { fputc(yytext[0], yyout); }
%%

int main()
{
    yyin = fopen("Input.txt", "r");
    yyout = fopen("Output.txt", "w");

    if (yyin == NULL || yyout == NULL)
    {
        printf("File Error\n");
        return 1;
    }

    yylex();
    
    fclose(yyin);
    fclose(yyout);
    
    printf("Whitespace characters replaced!\n");

    return 0;
}

int yywrap()
{
    return 1;
}

