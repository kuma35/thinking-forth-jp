**DOER JOE**

| \|c\|

Creates a **DOER** word called JOE, that does nothing.

**: TEST  MAKE JOE  1 . ;**

| \|c\|

+----+----+----+----+----+----+
+----+----+----+----+----+----+

Defines a new word called TEST

**TEST**

+----+----+----+----+----+----+
+----+----+----+----+----+----+

**MAKE** redirects JOE so that it points to the code after **MAKE** JOE,
and stops execution of the rest of TEST.

**JOE**

Executes the code that JOE points to ( **1 .** ).
