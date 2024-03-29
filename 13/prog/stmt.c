#include <stdio.h>
#include <stdlib.h>
#include "stmt.h"
#include "expr.h"
#include "string_util.h"

// constructor for assignment statement
STMT *stmt_create_assign(char *var, EXPR *expr) {
   STMT *s = (STMT *)malloc(sizeof(STMT));
   s->stmt_type = ASSIGN_TYPE;
   s->id = str_dup(var);
   s->expr = expr;
   return s;
}

// constructor for call statement
STMT *stmt_create_call(char *fname, EXPR *expr) {
   STMT *s = (STMT *)malloc(sizeof(STMT));
   s->stmt_type = CALL_TYPE;
   s->id = str_dup(fname);
   s->expr = expr;
   return s;
}

// print this statement
void stmt_print(STMT *stmt) {
   if(stmt->stmt_type == 0) {
      printf("%s(", stmt->id);

      if(stmt->expr != NULL) {
         expr_print(stmt->expr);
      }
      printf(")");
   }

   if(stmt->stmt_type == 1) {
      printf("%s = ", stmt->id);

      if(stmt->expr != NULL)
         expr_print(stmt->expr);
   }

}
