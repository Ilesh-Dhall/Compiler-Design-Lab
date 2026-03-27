%{
    #include <stdio.h>    
%}

%s A B C INV

%%
<INITIAL>a          BEGIN A;
<INITIAL>b          BEGIN B;
<INITIAL>[^\n]      BEGIN INV;
<INITIAL>\n         { printf("Accepted\n"); BEGIN INITIAL; }

<A>a                BEGIN INITIAL;
<A>b                BEGIN C;
<A>[^\n]            BEGIN INV;
<A>\n               { printf("Not Accepted\n"); BEGIN INITIAL; }

<B>a                BEGIN C;
<B>b                BEGIN INITIAL;
<B>[^\n]            BEGIN INV;
<B>\n               { printf("Not Accepted\n"); BEGIN INITIAL; }

<C>a                BEGIN B;
<C>b                BEGIN A;
<C>[^\n]            BEGIN INV;
<C>\n               { printf("Not Accepted\n"); BEGIN INITIAL; }

<INV>.              BEGIN INV;
<INV>\n             { printf("Invalid\n"); BEGIN INITIAL; }
%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}