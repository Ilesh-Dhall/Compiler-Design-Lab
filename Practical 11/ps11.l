%{
    #include <stdio.h>
    char buffer[100];
    int i = 0;
%}

%x ID INT FLOAT

%%
<INITIAL>[a-zA-Z_]    { i = 0; buffer[i++] = yytext[0]; BEGIN(ID); }
<INITIAL>[0-9]        { i = 0; buffer[i++] = yytext[0]; BEGIN(INT); }
<INITIAL>[ \t\n]      ;

<ID>[a-zA-Z0-9_]      { buffer[i++] = yytext[0]; }
<ID>[^a-zA-Z0-9_]     { buffer[i] = '\0'; printf("IDENTIFIER: %s\n", buffer); BEGIN(INITIAL); unput(yytext[0]); }


<INT>[0-9]            { buffer[i++] = yytext[0]; }
<INT>"."              { buffer[i++] = yytext[0]; BEGIN(FLOAT); }
<INT>[^0-9.]          { buffer[i] = '\0'; printf("INTEGER: %s\n", buffer); BEGIN(INITIAL); unput(yytext[0]); }

<FLOAT>[0-9]          { buffer[i++] = yytext[0]; }
<FLOAT>[^0-9]         { buffer[i] = '\0'; printf("FLOAT: %s\n", buffer); BEGIN(INITIAL); unput(yytext[0]); }
%%

int main()
{
    printf("Enter input:\n");
    yylex();
    return 0;
}

int yywrap()
{
return 1;
}