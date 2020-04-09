
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%
<<EOF>> 			{return EOL;}
[:]				{return (*yytext);}
[,]				{return (*yytext);}
[\{] 				{return (*yytext);}
[\}] 				{return (*yytext);}
[\[] 				{return (*yytext);}
[\]] 				{return (*yytext);}
["][a-zA-Z][a-zA-Z0-9\_\ ]*["] 	{return NAME;}
[0-9]+ 				{return INT;}
[0-9]+[.][0-9]+			{return FLOAT;}
true				{return BOOL;}
false				{return BOOL;}
[[:space:]]+ ;
. {yyerror("");};


%%

int yywrap() {
  return 1;
}
