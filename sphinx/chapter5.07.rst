More Tips for Readability
=========================

Here are some final suggestions to make your code more readable.
(Definitions appear in .)

One constant that pays for itself in most applications is (the ASCII
value for “blank-space”).

The word is used primarily within colon definitions to free you from
having to know the literal value of an ASCII character. For instance,
instead of writing:

: ( 41 WORD DROP ; IMMEDIATE

where 41 is the ASCII representation for right-parenthesis, you can
write

: ( ASCII ) WORD DROP ; IMMEDIATE

A pair of words that can make dealing with booleans more readable are
and . With these additions you can write phrases such as

TRUE ’STAMP? !

to set a flag or

FALSE ’STAMP? !

to clear it.

(I once used and , but the words are needed so rarely I now heed the
injunction against abbreviations.)

As part of your application (not necessarily part of your Forth system),
you can take this idea a step further and define:

: ON ( a) TRUE SWAP ! ; : OFF ( a) FALSE SWAP ! ;

These words allow you to write:

’STAMP? ON

or

’STAMP? OFF

Other names for these definitions include and , although and most
commonly use bit masks to manipulate individual bits.

An often-used word is , which determines whether a given value lies
within two other values. The syntax is:

n lo hi WITHIN

where “n” is the value to be tested and “lo” and “hi” represent the
range. returns true if “n” is *greater-than or equal-to* “lo” and
*less-than* “hi.” This use of the non-inclusive upper limit parallels
the syntax of s.

recommends the word . It’s useful for adding a value to the number just
under the top stack item, instead of to the top stack item. It could be
implemented in high level as:

: UNDER+ ( a b c – a+c b ) ROT + SWAP ;
