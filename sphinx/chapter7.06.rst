Application Stacks
==================

In the last section we examined some ways to save and restore a single
previous value. Some applications require *several* values to be saved
and restored. You may often find the best solution to this problem in
defining your own stack.

Here is the code for a user stack including very simple error checking
(an error clears the stack):

CREATE STACK 12 ALLOT   2tos-pointer \| 10stack [5 cells] HERE CONSTANT
STACK> : INIT-STACK STACK STACK ! ; INIT-STACK : ?BAD ( ?) IF .“ STACK
ERROR ” INIT-STACK ABORT THEN ; : PUSH ( n) 2 STACK +! STACK @ DUP
STACK> = ?BAD ! ; : POP ( – n) STACK @ @ -2 STACK +! STACK @ STACK <
?BAD ;

The word takes a value from off of your data stack and “pushes” it onto
this new stack. is the opposite, “popping” a value from off the new
stack, and onto Forth’s data stack.

In a real application you might want to change the names and to better
match their conceptual purposes.
