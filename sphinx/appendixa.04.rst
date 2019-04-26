Control Structures
==================

Forth provides all the control structures needed for structured,
GOTO-less programming.

The syntax of the construct is as follows:

... ( flag ) IF KNOCK THEN OPEN ...

The “flag” is a value on the stack, consumed by IF. A non-zero value
indicates true, zero indicates false. A true flag causes the code after
(in this case, the word ) to be executed. The word marks the end of the
conditional phrase; execution resumes with the word . A false flag
causes the code between and to *not* be executed. In either case, will
be performed.

The word allows an alternate phrase to be executed in the false case. In
the phrase:

( flag ) IF KNOCK ELSE RING THEN OPEN ...

the word will be performed if the flag is true, otherwise the word will
be performed. Either way, execution will continue starting with .

Forth also provides for indexed loops in the form

( limit) ( index) DO ... LOOP

and indefinite loops in the forms:

... BEGIN ... ( flag) UNTIL

and

... BEGIN ... ( flag) WHILE ... REPEAT ;
