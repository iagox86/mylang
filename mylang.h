typedef enum {
  typeCon,
  typeId,
  typeOpr
} nodeEnum;

/* Constants */
typedef struct {
  int value;
} conNodeType;

/* Identifiers */
typedef struct {
  int i;
} idNodeType;

/* Operators */
typedef struct {
  int oper;                /* Operator */
  int nops;                /* Number of operants */
  struct nodeTypeTag **op; /* Operands */
} oprNodeType;

typedef struct nodeTypeTag {
  nodeEnum type;           /* Type of node */

  union {
    conNodeType con; /* Constants */
    idNodeType  id;  /* Identifiers */
    oprNodeType opr; /* Operators */
  };
} nodeType;

extern int sym[26];
