From 
=====

The word can be defined as:

:   ( skip rest of line) >IN @ 64 / 1+ 64 \* >IN ! ; IMMEDIATE

If you decide not to use to terminate a screen, you can define as:

: §1024 >IN ! ;

The word can be defined simply as:

: FH   ( offset – offset-block) “from here” BLK @ + ;

This factoring allows you to use in many ways, e.g.:

: TEST [ 1 FH ] LITERAL LOAD ;

or

: SEE [ 2 FH ] LITERAL LIST ;

A slightly more complicated version of also lets you edit or load a
screen with a phrase such as “,” relative to the screen that you just
listed ():

: FH   ( offset – offset-block) “from here” BLK @ ?DUP 0= IF SCR @ THEN
+ ;

is a simple constant:

32 CONSTANT BL

and can be defined as:

0 CONSTANT FALSE -1 CONSTANT TRUE

(Forth’s control words such as and interpret zero as “false” and any
non-zero value as “true.” Before Forth ’83, the convention was to
indicate “true” with the value :math:`1`. Starting with Forth ’83,
however, “true” is indicated with hex , which is the signed number
:math:`-1` (all bits set).

can be defined in high level like this:

: WITHIN ( n lo hi+1 – ?) >R 1- OVER < SWAP R> < AND ;

or

: WITHIN ( n lo hi+1 – ?) OVER - >R - R> U< ;
