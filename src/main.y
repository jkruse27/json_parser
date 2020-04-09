

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token NAME BOOL INT FLOAT EOL
%right ','

%%

JSON:
	'{' EXPRESSION '}' JSON EOL 	{printf("VALIDO\n"); return 0;}
	|	
	;

EXPRESSION:
	NAME ':' VALUE
	| EXPRESSION ',' EXPRESSION
	;

VALUE:
	NAME
	| BOOL 
	| INT
	| FLOAT 
	| '{' EXPRESSION '}'
	| '[' VALUES ']'
	| '[' ']'
	;

VALUES:
	VALUE
	| VALUE ',' VALUES
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
