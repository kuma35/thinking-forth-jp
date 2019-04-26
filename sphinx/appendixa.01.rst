The Dictionary
==============

Forth is expressed in words (and numbers) and is separated by spaces:

HAND OPEN ARM LOWER HAND CLOSE ARM RAISE

Such commands may be typed directly from the keyboard, or edited onto
mass storage then “”ed.

All words, whether included with the system or user-defined, exist in
the “dictionary,” a linked list. A “defining word” is used to add new
names to the dictionary. One defining word is (pronounced “colon”),
which is used to define a new word in terms of previously defined words.
Here is how one might define a new word called :

: LIFT HAND OPEN ARM LOWER HAND CLOSE ARM RAISE ;

The terminates the definition. The new word may now be used instead of
the long sequence of words that comprise its definition.

Forth words can be nested like this indefinitely. Writing a Forth
application consists of building increasingly powerful definitions, such
as this one, in terms of previously defined ones.

Another defining word is , which is used in place of colon to define a
command in terms of machine instructions for the native processor. Words
defined with are indistinguishable to the user from words defined with
colon. definitions are needed only for the most time-critical portions
of an applications, if at all.
