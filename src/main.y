

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token NAME INT FLOAT EOL COLON COMMA OSQUARE CSQUARE OCURLY CCURLY SPACE

%%
JSON:
	JSON EXPRESSION EOL 	{printf("VALIDO\n");}	
	|
	;

EXPRESSION:
	OCURLY PAIR CCURLY
	| OCURLY EOL PAIR CCURLY
	| OCURLY PAIR EOL CCURLY
	| OCURLY EOL PAIR EOL CCURLY
	; 

PAIR:
	NAME COLON VALUE
	| PAIR COMMA PAIR
	| PAIR COMMA EOL PAIR
	|
	;

VALUES:
	VALUE
	| VALUES COMMA VALUES 
	| VALUES COMMA EOL VALUES 
	;
VALUE:
	NAME 
	| INT
	| FLOAT 
	| EXPRESSION
	| OSQUARE VALUES CSQUARE
	| OSQUARE CSQUARE
	;

%%

void yyerror(char *s) {
	printf("INVALIDO\n");
}

int main() {
	yyparse();
	return 0;

}
