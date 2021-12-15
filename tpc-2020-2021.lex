%{
#include "tpc-2020-2021.tab.h"
int lineno;
%}
%x  COMM
%option nounput
%option noinput
%option noyywrap

%%
\n    {lineno++;}
"/*" BEGIN COMM;
<COMM>"*/" BEGIN INITIAL;
"//".* BEGIN COMM; 
<COMM>.|\n ; {if (yytext[0] == '\n') lineno++;}
'='	; {return EQ;}
"<"|">"|"<="|">="	{return ORDER;}
"+"|"-" 	{return ADDSUB;}
"/"|"*" 	{return DIVSTAR;}
void    {return VOID;}
print  	{return PRINT;}
if 		{return IF;}
else    {return ELSE;}
while   {return WHILE;}
return  {return RETURN;}
reade 	{return READE;}
readc 	{return READC;}
[0-9]+  	{return NUM;}
"||"  {return OR;}
"&&"      {return AND;}
\'.\' 	{return CHARACTER;}
" "|\t ;
int|double|char|long|short|float  {return TYPE;}
[a-zA-Z_][a-zA-Z0-9_]*   ;  {return IDENT;}
. ;	return yytext[0];
%%
