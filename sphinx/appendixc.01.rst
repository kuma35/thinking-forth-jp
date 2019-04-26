From 
=====

A definition of that will work in ’83 Standard is:

: ASCII ( – c)   Compile: c ( – )  Interpret: c ( – c) BL WORD 1+ C@
STATE @ IF [COMPILE] LITERAL THEN ; IMMEDIATE
