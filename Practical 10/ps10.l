%{
    #include<stdio.h>
    #include<string.h>
    char str[100];
    int len = 0;
%}

%x S1 S2 S3

%%
^[ab]              { str[0] = yytext[0]; str[1] = '\0'; len = 1; BEGIN S1; }
<S1>[ab]           { str[1] = yytext[0]; str[2] = '\0'; len = 2; BEGIN S2; }
<S2>[ab]           { str[2] = yytext[0]; str[3] = '\0'; len = 3; BEGIN S3; }
<S3>[ab]           { str[0] = str[1]; str[1] = str[2]; str[2] = yytext[0]; str[3] = '\0'; len = 3; }
<INITIAL,S1,S2,S3>\n {
                    if(len >= 3 && str[0] == 'a')
                        printf("Accepted: Third last symbol is 'a'\n");
                    else
                        printf("Rejected: Third last symbol is NOT 'a'\n");
                    len = 0;
                    str[0] = '\0';
                    BEGIN INITIAL;
                  }
[ \t\r]+
<INITIAL,S1,S2,S3>.
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter string over {a,b}:\n");
    yylex();
    return 0;
}