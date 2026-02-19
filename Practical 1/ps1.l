%{
    #include <stdio.h>
    int spaces=0;
    int tabs=0;
    int newlines=0;
    int rest=0;
%}  

%%
" "     { spaces++; }
"\t"    { tabs++; }
"\n"    { newlines++; }
.       { rest++; }
%%

int main()
{
    printf("Enter text : \n");
    yylex();
    printf("\nSpaces %d\n", spaces);
    printf("Tabs : %d\n", tabs);
    printf("Newlines : %d\n", newlines);
    printf("Others : %d\n", rest);
    
    return 0;
}

int yywrap()
{
    return 1;
}