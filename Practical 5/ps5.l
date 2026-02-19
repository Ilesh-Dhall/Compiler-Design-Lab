%{
    #include <stdio.h>
    int characters=0, words=0, spaces=0, lines=0;
    extern FILE *yyin;
%}

%%
[\n]            { lines++; characters++; }
[ \t]+          { spaces += yyleng; characters += yyleng; }
[a-zA-Z0-9]+    { words++; characters += yyleng; }
.               { characters++; }
%%

int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");

    yylex();

    fclose(yyin);
    
    printf("Characters : %d\n", characters);
    printf("Words      : %d\n", words);
    printf("Spaces     : %d\n", spaces);
    printf("Lines      : %d\n", lines);

    return 0;
}

int yywrap()
{
    return 1;
}