%{
/* tpc-2020-2021.y */
/* Syntaxe du TPC pour le projet d'analyse syntaxique de 2020-2021*/

#include <stdio.h>
int yyparse();
int yylex();
void yyerror(char *);
extern int lineno;

%}

%token IDENT
%token TYPE
%token VOID
%token READE
%token READC
%token PRINT
%token IF
%token ELSE
%token WHILE
%token NUM
%token CHARACTER
%token OR
%token AND
%token EQ
%token RETURN
%token ADDSUB
%token ORDER
%token DIVSTAR

%%
Prog:  DeclVars DeclFoncts 
    ;
DeclVars:
       DeclVars TYPE Declarateurs ';' 
    |
    ;
Declarateurs:
       Declarateurs ',' IDENT 
    |  IDENT 
    ;
DeclFoncts:
       DeclFoncts DeclFonct 
    |  DeclFonct 
    ;
DeclFonct:
       EnTeteFonct Corps 
    ;
EnTeteFonct:
       TYPE IDENT '(' Parametres ')' 
    |  VOID %{
/* tpc-2020-2021.y */
/* Syntaxe du TPC pour le projet d'analyse syntaxique de 2020-2021*/

#include <stdio.h>
int yyparse();
int yylex();
void yyerror(char *);
extern int lineno;

%}

%token IDENT
%token TYPE
%token VOID
%token READE
%token READC
%token PRINT
%token IF
%token ELSE
%token WHILE
%token NUM
%token CHARACTER
%token OR
%token AND
%token EQ
%token RETURN
%token ADDSUB
%token ORDER
%token DIVSTAR

%%
Prog:  DeclVars DeclFoncts 
    ;
DeclVars:
       DeclVars TYPE Declarateurs ';' 
    |
    ;
Declarateurs:
       Declarateurs ',' IDENT 
    |  IDENT 
    ;
DeclFoncts:
       DeclFoncts DeclFonct 
    |  DeclFonct 
    ;
DeclFonct:
       EnTeteFonct Corps 
    ;
EnTeteFonct:
       TYPE IDENT '(' Parametres ')' 
    |  VOID IDENT '(' Parametres ')' 
    ;
Parametres:
       VOID 
    |  ListTypVar 
    ;
ListTypVar:
       ListTypVar ',' TYPE IDENT 
    |  TYPE IDENT 
    ;
Corps: '{' DeclVars SuiteInstr '}' 
    ;
SuiteInstr:
       SuiteInstr Instr 
    |
    ;
Instr:
       LValue '=' Exp ';'
    |  READE '(' IDENT ')' ';'
    |  READC '(' IDENT ')' ';'
    |  PRINT '(' Exp ')' ';'
    |  IF '(' Exp ')' Instr 
    |  IF '(' Exp ')' Instr ELSE Instr
    |  WHILE '(' Exp ')' Instr
    |  IDENT '(' Arguments  ')' ';'
    |  RETURN Exp ';' 
    |  RETURN ';' 
    |  '{' SuiteInstr '}' 
    |  ';' 
    ;
Exp :  Exp OR TB 
    |  TB 
    ;
TB  :  TB AND FB 
    |  FB 
    ;
FB  :  FB EQ M
    |  M
    ;
M   :  M ORDER E 
    |  E 
    ;
E   :  E ADDSUB T 
    |  T 
    ;    
T   :  T DIVSTAR F 
    |  F 
    ;
F   :  ADDSUB F 
    |  '!' F 
    |  '(' Exp ')' 
    |  NUM 
    |  CHARACTER
    |  LValue
    |  IDENT '(' Arguments  ')' 
    ;
LValue:
       IDENT 
    ;
Arguments:
       ListExp 
    |
    ;
ListExp:
       ListExp ',' Exp 
    |  Exp 
    ;
%%

void yyerror(char *s){
	printf("%s near line %d\n",s,lineno+1);
}

int main(int argc, char *argv[])
{
    return yyparse();
    
}
