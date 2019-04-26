Looking Back, and Forth
=======================

In this section we’ll review the fundamental features of Forth and
relate them to what we’ve seen about traditional methodologies.

Here’s an example of Forth code;

: BREAKFAST HURRIED? IF CEREAL ELSE EGGS THEN CLEAN ;

This is structurally identical to the procedure on page . (If you’re new
to Forth, refer to for an explanation.) The words , , , and are (most
likely) also defined as colon definitions.

Up to a point, Forth exhibits all the traits we’ve studied: mnemonic
value, abstraction, power, structured control operators, strong
functional binding, limited coupling, and modularity. But regarding
modularity, we encounter what may be Forth’s most significant
breakthrough:

The smallest atom of a Forth program is not a module or a subroutine or
a procedure, but a “word.”

Furthermore, there are no subroutines, main programs, utilities, or
executives, each of which must be invoked differently. *Everything* in
Forth is a word.

Before we explore the significance of a word-based environment, let’s
first study two Forth inventions that make it possible.

Implicit Calls
--------------

First, calls are implicit. You don’t have to say , you simply say . In
Forth, the definition of “knows” what kind of word it is and what
procedure to use to invoke itself.

Thus variables and constants, system functions, utilities, as well as
any user-defined commands or data structures can all be “called” simply
by name.

Implicit Data Passing
---------------------

Second, data passing is implicit. The mechanism that produces this
effect is Forth’s data stack. Forth automatically pushes numbers onto
the stack; words that require numbers as input automatically pop them
off the stack; words that produce numbers as output automatically push
them onto the stack. The words and do not exist in high-level Forth.

Thus we can write:

: DOIT GETC TRANSFORM-TO-D PUT-D ;

confident that will get “C,” and leave it on the stack. will pick up “C”
from the stack, transform it, and leave “D” on the stack. Finally, will
pick up “D” on the stack and write it. Forth eliminates the act of
passing data from our code, leaving us to concentrate on the functional
steps of the data’s transformation.

Because Forth uses a stack for passing data, words can nest within
words. Any word can put numbers on the stack and take them off without
upsetting the f1ow of data between words at a higher level (provided, of
course, that the word doesn’t consume or leave any unexpected values).
Thus the stack supports structured, modular programming while providing
a simple mechanism for passing local arguments.

Forth eliminates from our programs the details of *how* words are
invoked and *how* data are passed. What’s left? Only the words that
describe our problem.

Having words, we can fully exploit the recommendations of —to decompose
problems according to things that may change, and have each “module”
consist of many small functions, as many as are needed to hide
information about that module. In Forth we can write as many words as we
need to do that, no matter how simple each of them may be.

A line from a typical Forth application might read:

20 ROTATE LEFT TURRET

Few other languages would encourage you to concoct a subroutine called ,
merely as a modifier, or a subroutine called , merely to name part of
the hardware.

Since a Forth word is easier to invoke than a subroutine (simply by
being named, not by being called), a Forth program is likely to be
decomposed into more words than a conventional program would be into
subroutines.
