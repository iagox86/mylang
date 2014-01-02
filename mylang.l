%{
#include <stdlib.h>
#include "mylang.h"
#include "mylang.tab.h"

void yyerror(char *);
%}

%%

[a-z]       {
               yylval.sIndex = *yytext - 'a';
               return VARIABLE;
            }

0           {
              yylval.iValue = 0;
              return INTEGER;
            }

[1-9][0-9]* {
               yylval.iValue = atoi(yytext);
               return INTEGER;
            }

0[0-9]*     {
              yylval.iValue = strtol(yytext, 0, 8);
              return INTEGER;
            }

0x[0-9a-fA-F]+ {
              yylval.iValue = strtol(yytext+2, 0, 16);
              return INTEGER;
            }

[-()<>=+*/;{}.] return *yytext;

">="        return GE;
"<="        return LE;
"=="        return EQ;
"!="        return NE;
"while"     return WHILE;
"if"        return IF;
"else"      return ELSE;
"print"     return PRINT;

[ \t\n]     ; /* Ignore whitespace */

.          yyerror("invalid character");

%%

int yywrap()
{
  return 1;
}

/*
int main(int argc, char *argv[])
{
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);

  printf("Number of identifiers: %d\n", count);

  return 0;
}
*/
