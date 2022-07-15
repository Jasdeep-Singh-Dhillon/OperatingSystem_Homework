#include "lexer.h"
#include "error.h"
#include "expr.h"
#include "stmt.h"
#include "prog.h"

//
// a predictive parser for a super-minimal programming language
//
// refer to the BNF  

// types of functions used below
void match();
PROG *parse(), *prog(), *prog1();
STMT *stmt();
EXPR *expr(), *expr1();

int lookahead;    // most recent token

// check that current token is t, and read next token
void match(int t) { 
    if (lookahead == t)
	lookahead = lexan();
    else error("syntax error");
} 

// parse a program
PROG *parse() {
   PROG *p;
   lookahead = lexan();
   p = prog();
   match(DONE);
   return p;
}


/*
prog ::= ID stmt1 ; prog1
prog1 ::= ID stmt1 ; prog1 | ""
stmt1 ::= ( expr ) | = expr
expr ::= ID expr1 | NUM
expr1 ::= ( expr ) | ""
*/


PROG *prog() {
    
	PROG *p = NULL; 
	EXPR *e = NULL;
	STMT* s = NULL;
	char *str = NULL;

	switch (lookahead) {

		case ID:
			str = lexer_id_val();
			match(ID);
			s = stmt(str);
			match(';');
			p = prog1(p);
			return prog_create(s, p);
		break;

		default:
			error("syntax error");
		break;

	}
}

PROG *prog1(PROG* p1) {
	PROG *p = NULL;
	EXPR *e = NULL;
	STMT *s = NULL;
	char *str = NULL;

	switch (lookahead) {

		case ID:
			str = lexer_id_val();
			match(ID);
			s = stmt(str);
			match(';');
			p = prog1(p1);
			return prog_create(s, p);
		break;

		default:
			return p1;
		break;

	}
}

STMT *stmt(char *str) {
	EXPR *e = NULL;

	switch (lookahead) {

		case '(':
			match('(');
			e = expr();
			match(')');	
			return stmt_create_call(str, e);
		break;

		case '=':
			match('=');
			e = expr();
			return stmt_create_assign(str, e);
		break;

		default:
			error("syntax error");
		break;
	}
}

EXPR *expr() {
	EXPR *e = NULL;
	char *str = NULL;
	int num;
	
	switch(lookahead) {

		case NUM:
			num = lexer_num_val();
			match(NUM);
			e = expr_create_num(num);
			return e;
		break;

		case ID:
			str = lexer_id_val();
			match(ID);
			e = expr1(str);
			return e;
		break;

		default:
			error("syntax error");
		break;
	}
}

EXPR *expr1(char *str) {
	EXPR *e = NULL;

	switch (lookahead) {

		case '(':
			match('(');
			e = expr();
			match(')');
			return expr_create_fcall(str, e);
		break;

		default:
			return expr_create_var(str);
		break;
	}
}