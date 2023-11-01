grammar Tiny;

programa
   : decl_sequencia + EOF
   ;

decl_sequencia
   : decl_sequencia ';' declaracao
   | declaracao
   ;

declaracao
   : cond_decl
   | repet_decl
   | atrib_decl
   | leit_decl
   | escr_decl
   ;

cond_decl
   : 'if' exp 'then' decl_sequencia 'end'
   | 'if' exp 'then' decl_sequencia 'else' decl_sequencia 'end'
   ;

repet_decl
   : 'repeat' decl_sequencia 'until' exp
   ;

atrib_decl
   : identificador ':=' exp
   ;

leit_decl
   : 'read' identificador
   ;

escr_decl
   : 'write' exp
   ;

exp
   : exp_simples comp_op exp_simples
   | exp_simples
   ;

comp_op
   : '<'
   | '='
   ;

exp_simples
   : exp_simples soma termo
   | termo
   ;

soma
   : '+'
   | '-'
   ;

termo
   : termo mult fator
   | fator
   ;

mult
   : '*'
   | '/'
   ;

fator
   : '(' exp ')'
   | numero
   | identificador
   ;


identificador
   : STRING
   ;

numero
   : INT
   ;


STRING
   : [a-z]+
   ;

INT
   : [0-9]+
   ;

WS
   : [ \r\n\t] -> skip
    ;