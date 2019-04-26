Factoring Techniques
====================

If a module seems almost, but not quite, useful from a second place in
the system, try to identify and isolate the useful subfunction. The
remainder of the module might be incorporated in its original caller
(from “*Structured Design*” :raw-latex:`\cite{stevens74-6}`).

The “useful subfunction” of course becomes the newly factored
definition.What about the part that “isn’t quite useful”? That depends
on what it is.

Factoring Out Data
------------------

The simplest thing to factor out is data, thanks to Forth’s data stack.
For instance, to compute two-thirds of 1,000, we write

1000 2 3 \*/

To define a word that computes two-thirds of *any* number, we factor out
the argument from the definition:

: TWO-THIRDS ( n1 – n2) 2 3 \*/ ;

When the datum comes in the *middle* of the useful phrase, we have to
use stack manipulation. For instance, to center a piece of text ten
characters long on an 80-column screen, we would write:

80 10 - 2/ SPACES

But text isn’t always 10 characters long. To make the phrase useful for
any string, you’d factor out the length by writing:

: CENTER ( length – ) 80 SWAP - 2/ SPACES ;

The data stack can also be used to pass addresses. Therefore what’s
factored out may be a *pointer* to data rather than the data themselves.
The data can be numbers or even strings, and still be factored out
through use of the stack.

Sometimes the difference appears to be a function, but you can factor it
out simply as a number on the stack. For instance:

Segment 1:
Segment 2:

How can you factor out the “” operation? By including “” in the
factoring and passing it a one or eight:

: NEW ( n ) WILLY NILLY \* PUDDIN’ PIE AND ;

Segment 1:
Segment 2:

(Of course if changes the stack, you’ll need to add appropriate
stack-manipulation operators.)

If the operation involves addition, you can nullify it by passing a
zero.

For simplicity, try to express the difference between similar fragments
as a numeric difference (values or addresses), rather than as a
procedural difference.

Factoring Out Functions
-----------------------

On the other hand, the difference sometimes *is* a function. Witness:

Segment 1:
      

    BLETCH-A BLETCH-B &poorbfBLETCH-C BLETCH-D BLETCH-E BLETCH-F

Segment 2:
      

    BLETCH-A BLETCH-B &poorbfPERVERSITY BLETCH-D BLETCH-E BLETCH-F

Wrong approach:

: BLETCHES ( t=do-BLETCH-C \| f=do-PERVERSITY – ) BLETCH-A BLETCH-B IF
&poorbfBLETCH-C ELSE &poorbfPERVERSITY THEN BLETCH-D BLETCH-E BLETCH-F ;

Segment 1:
      

Segment 2:
      

A better approach:

: BLETCH-AB BLETCH-A BLETCH-B ; : BLETCH-DEF BLETCH-D BLETCH-E BLETCH-F
;

Segment 1:
      

Segment 2:
      

Don’t pass control flags downward.

Why not? First, you are asking your running application to make a
pointless decision—one you knew the answer to while programming—thereby
reducing efficiency. Second, the terminology doesn’t match the
conceptual model. What are as opposed to ?

Factoring Out Code from Within Control Structures
-------------------------------------------------

Be alert to repetitions on either side of an statement. For instance:

... ( c) DUP BL 127 WITHIN IF EMIT ELSE DROP ASCII . EMIT THEN ...

This fragment normally emits an ASCII character, but if the character is
a control code, it emits a dot. Either way, an is performed. Factor out
of the conditional structure, like this:

... ( c) DUP BL 127 WITHIN NOT IF DROP ASCII . THEN EMIT ...

The messiest situation occurs when the difference between two
definitions is a function within a structure that makes it impossible to
factor out the half-fragments. In this case, use stack arguments,
variables, or even vectoring. We’ll see how vectoring can be used in a
section of called “Using DOER/MAKE.”

Here’s a reminder about factoring code from out of a :

In factoring out the contents of a into a new definition, rework the
code so that (the index) is not referenced within the new definition,
but rather passed as a stack argument to it.

Factoring Out Control Structures Themselves
-------------------------------------------

Here are two definitions whose differences lies within a construct:

: ACTIVE A B OR C AND IF TUMBLE JUGGLE JUMP THEN ; : LAZY A B OR C AND
IF SIT EAT SLEEP THEN ;

The condition and control structure remain the same; only the event
changes. Since you can’t factor the into one word and the into another,
the simplest thing is to factor the condition:

: CONDITIONS? ( – ?) A B OR C AND ; : ACTIVE CONDITIONS? IF TUMBLE
JUGGLE JUMP THEN ; : LAZY CONDITIONS? IF SIT EAT SLEEP THEN ;

Depending on the number of repetitions of the same condition and control
structure, you may even want to factor out both. Watch this:

: CONDITIONALLY A B OR C AND NOT IF R> DROP THEN ; : ACTIVE
CONDITIONALLY TUMBLE JUGGLE JUMP ; : LAZY CONDITIONALLY SIT EAT SLEEP ;

The word may—depending on the condition—alter the control flow so that
the remaining words in each definition will be skipped. This approach
has certain disadvantages as well. We’ll discuss this technique—pros and
cons—in .

More benign examples of factoring-out control structures include case
statements, which eliminate nested s, and multiple exit loops (the
construct). We’ll also discuss these topics in .

Factoring Out Names
-------------------

It’s even good to factor out names, when the names seem almost, but not
quite, the same. Examine the following terrible example of code, which
is meant to initialize three variables associated with each of eight
channels:

VARIABLE 0STS VARIABLE 1STS VARIABLE 2STS VARIABLE 3STS VARIABLE 4STS
VARIABLE 5STS VARIABLE 6STS VARIABLE 7STS VARIABLE 0TNR VARIABLE 1TNR
VARIABLE 2TNR VARIABLE 3TNR VARIABLE 4TNR VARIABLE 5TNR VARIABLE 6TNR
VARIABLE 7TNR VARIABLE 0UPS VARIABLE 1UPS VARIABLE 2UPS VARIABLE 3UPS
VARIABLE 4UPS VARIABLE 5UPS VARIABLE 6UPS VARIABLE 7UPS

: INIT-CHO 0 0STS ! 1000 0TNR ! -1 0UPS ! ; : INIT-CH1 0 1STS ! 1000
1TNR ! -1 1UPS ! ; : INIT-CH2 0 2STS ! 1000 2TNR ! -1 2UPS ! ; :
INIT-CH3 0 3STS ! 1000 3TNR ! -1 3UPS ! ; : INIT-CH4 0 4STS ! 1000 4TNR
! -1 4UPS ! ; : INIT-CH5 0 5STS ! 1000 5TNR ! -1 5UPS ! ; : INIT-CH6 0
6STS ! 1000 6TNR ! -1 6UPS ! ; : INIT-CH7 0 7STS ! 1000 7TNR ! -1 7UPS !
;

: INIT-ALL-CHS INIT-CHO INIT-CH1 INIT-CH2 INIT-CH3 INIT-CH4 INIT-CH5
INIT-CH6 INIT-CH7 ;

First there’s a similarity among the names of the variables; then
there’s a similarity in the code used in all the words.

Here’s an improved rendition. The similar variable names have been
factored into three data structures, and the lengthy recital of words
has been factored into a :

: ARRAY ( #cells – ) CREATE 2\* ALLOT DOES> ( i – ’cell) SWAP 2\* + ; 8
ARRAY STATUS ( channel# – adr) 8 ARRAY TENOR ( “ ) 8 ARRAY UPSHOT ( ” )
: STABLE 8 0 DO 0 I STATUS ! 1000 I TENOR ! -1 I UPSHOT ! LOOP ;

That’s all the code we need.

Even in the most innocent cases, a little data structure can eliminate
extra names. By convention Forth handles text in “counted strings”
(i.e., with the count in the first byte). Any word that returns the
“address of a string” actually returns this beginning address, where the
count is. Not only does use of this two-element data structure eliminate
the need for separate names for string and count, it also makes it
easier to move a string in memory, because you can copy the string *and*
the count with a single .

When you start finding the same awkwardness here and there, you can
combine things and make the awkwardness go away.

Factoring Out Functions into Defining Words
-------------------------------------------

If a series of definitions contains identical functions, with variation
only in data, use a defining word.

Examine the structure of this code (without worrying about its
purpose—you’ll see the same example later on):

: HUE ( color – color’) ’LIGHT? @ OR 0 ’LIGHT? ! ; : BLACK 0 HUE ; :
BLUE 1 HUE ; : GREEN 2 HUE ; : CYAN 3 HUE ; : RED 4 HUE ; : MAGENTA 5
HUE ; : BROWN 6 HUE ; : GRAY 7 HUE ;

The above approach is technically correct, but less memory-efficient
than the following approach using defining words:

: HUE ( color – ) CREATE , DOES> ( – color ) @ ’LIGHT? @ OR 0 ’LIGHT? !
; 0 HUE BLACK 1 HUE BLUE 2 HUE GREEN 3 HUE CYAN 4 HUE RED 5 HUE MAGENTA
6 HUE BROWN 7 HUE GRAY

(Defining words are explained in *Starting Forth*, Chapter Eleven).

By using a defining word, we save memory because each compiled colon
definition needs the address of to conclude the definition. (In defining
eight words, the use of a defining word saves 14 bytes on a 16-bit
Forth.) Also, in a colon definition each reference to a numeric literal
requires the compilation of (or ), another 2 bytes per definition. (If 1
and 2 are predefined constants, this costs another 10 bytes—24 total.)

In terms of readability, the defining word makes it absolutely clear
that all the colors it defines belong to the same family of words.

The greatest strength of defining words, however, arises when a series
of definitions share the same *compile-time* behavior. This topic is the
subject of a later section, “Compile-Time Factoring.”
