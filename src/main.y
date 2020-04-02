

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token NAME BOOL INT FLOAT EOL COLON COMMA OSQUARE CSQUARE OCURLY CCURLY
%right COMMA

%%

JSON:
	OCURLY EXPRESSION CCURLY JSON EOL 	{printf("VALIDO\n"); return 0;}
	|	
	;

EXPRESSION:
	NAME COLON VALUE
	| EXPRESSION COMMA EXPRESSION
	;

VALUE:
	NAME
	| BOOL 
	| INT
	| FLOAT 
	| OCURLY EXPRESSION CCURLY
	| OSQUARE VALUES CSQUARE
	| OSQUARE CSQUARE
	;

VALUES:
	VALUE
	| VALUE COMMA VALUES
	;

%%

void yyerror(char *s) {
	printf("INVALIDO\n");
	exit(1);
}

int main() {
	yyparse();
	return 0;

}
