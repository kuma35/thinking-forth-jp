How to Eliminate Control Structures
===================================

In this section we’ll study numerous techniques for simplifying or
avoiding conditionals. Most of them will produce code that is more
readable, more maintainable, and more efficient. Some of the techniques
produce code that is more efficient, but not always as readable.
Remember, therefore: Not all of the tips will be applicable in all
situations.

Using the Dictionary
--------------------

Give each function its own definition.

By using the Forth dictionary properly, we’re not actually eliminating
conditionals; we’re merely factoring them out from our application code.
The Forth dictionary is a giant string case statement. The match and
execute functions are hidden within the Forth system.

:

In my accounting package, if you receive a check from somebody, you type
the amount, the check number, the word , and the person’s name:

200.00 127 FROM ALLIED

The word takes care of that situation. If you want to bill someone, you
type the amount, the invoice number, the word and the person’s name:

1000.00 280 BILL TECHNITECH

… One word for each situation. The dictionary is making the decision.

This notion pervades Forth itself. To add a pair of single-length
numbers we use the command . To add a pair of double-length numbers we
use the command . A less efficient, more complex approach would be a
single command that somehow “knows” which type of numbers are being
added.

Forth is efficient because all these words— and and and —can be
implemented without any need for testing and branching.

Use dumb words.

This isn’t advice for TV writers. It’s another instance of using the
dictionary. A “dumb” word is one that is not state-dependent, but
instead, has the same behavior all the time (“referentially
transparent”).

A dumb word is unambiguous, and therefore, more trustworthy.

A few common Forth words have been the source of controversy recently
over this issue. One such word is which prints a string. In its simplest
form, it’s allowed only inside a colon definition:

: TEST .“ THIS IS A STRING ” ;

Actually, this version of the word does *not* print a string. It
*compiles* a string, along with the address of another definition that
does the printing at run time.

This is the dumb version of the word. If you use it outside a colon
definition, it will uselessly compile the string, not at all what a
beginner might expect.

To solve this problem, the FIG model added a test inside that determined
whether the system was currently compiling or interpreting. In the first
case, would compile the string and the address of the primitives; in the
second case it would it.

became two completely different words housed together in one definition
with an structure. The flag that indicates whether Forth is compiling or
interpreting is called . Since the depends on , it is said to be
“-dependent,” literally.

The command *appeared* to behave the same inside and outside a colon
definition. This duplicity proved useful in afternoon introductions to
Forth, but the serious student soon learned there’s more to it than
that.

Suppose a student wants to write a new word called (for
“bright-dot-quote”) to display a string in bright characters on her
display, to be used like this:

.“ INSERT DISK IN ” B.“ LEFT ” .“ DRIVE ”

She might expect to define as

: B.“ BRIGHT .” NORMAL ;

that is, change the video mode to bright, print the string, then reset
the mode to normal.

She tries it. Immediately the illusion is destroyed; the deception is
revealed; the definition won’t work.

To solve her problem, the programmer will have to study the definition
of in her own system. I’m not going to get sidetracked here with
explaining how works—my point is that smartness isn’t all it appears to
be.

Incidentally, there’s a different syntactical approach to our student’s
problem, one that does not require having two separate words, and to
print strings. Change the system’s so that it always sets the mode to
normal after typing, even though it will already be normal most of the
time. With this syntax, the programmer need merely precede the
emphasized string with the simple word .

.“ INSERT DISK IN ” BRIGHT .“ LEFT ” .“ DRIVE ”

The ’83 Standard now specifies a dumb and, for those cases where an
interpretive version is wanted, the new word has been added. Happily, in
this new standard we’re using the dictionary to make a decision by
having two separate words.

The word (tick) has a similar history. It was -dependent in fig-Forth,
and is now dumb in the ’83 Standard. Tick shares with dot-quote the
characteristic that a programmer might want to reuse either of these
words in a higher-level definition and have them behave in the same way
they do normally.

Words should not depend on if a programmer might ever want to invoke
them from within a higher-level definition and expect them to behave as
they do interpretively.

works well as a -dependent word, and so does . (See .)

Nesting and Combining Conditionals
----------------------------------

Don’t test for something that has already been excluded.

Take this example, please:

: PROCESS-KEY KEY DUP LEFT-ARROW = IF CURSOR-LEFT THEN DUP RIGHT-ARROW =
IF CURSOR-RIGHT THEN DUP UP-ARROW = IF CURSOR-UP THEN DOWN-ARROW = IF
CURSOR-DOWN THEN ;

This version is inefficient because all four tests must be made
regardless of the outcome of any of them. If the key pressed was the
left-arrow key, there’s no need to check if it was some other key.

Instead, you can nest the conditionals, like this:

: PROCESS-KEY KEY DUP LEFT-ARROW = IF CURSOR-LEFT ELSE DUP RIGHT-ARROW =
IF CURSOR-RIGHT ELSE DUP UP-ARROW = IF CURSOR-UP ELSE CURSOR-DOWN THEN
THEN THEN DROP ;

Combine booleans of similar weight.

Many instances of doubly-nested structures can be simplified by
combining the flags with logical operators before making the decision.
Here’s a doubly-nested test:

: ?PLAY SATURDAY? IF WORK FINISHED? IF GO PARTY THEN THEN ;

The above code uses nested s to make sure that it’s both Saturday and
the chores are done before it boogies on down. Instead, let’s combine
the conditions logically and make a single decision:

: ?PLAY SATURDAY? WORK FINISHED? AND IF GO PARTY THEN ;

It’s simpler and more readable.

The logical “or” situation, when implemented with s, is even clumsier:

: ?RISE PHONE RINGS? IF UP GET THEN ALARM-CLOCK RINGS? IF UP GET THEN ;

This is much more elegantly written as

: ?RISE PHONE RINGS? ALARM RINGS? OR IF UP GET THEN ;

One exception to this rule arises when the speed penalty for checking
some of the conditions is too great.

We might write

: ?CHOW-MEIN BEAN-SPROUTS? CHOW-MEIN RECIPE? AND IF CHOW-MEIN PREPARE
THEN ;

But suppose it’s going to take us a long time to hunt through our recipe
file to see if there’s anything on chow mein. Obviously there’s no point
in undertaking the search if we have no bean sprouts in the fridge. It
would be more efficient to write

: ?CHOW-MEIN BEAN-SPROUTS? IF CHOW-MEIN RECIPE? IF CHOW-MEIN PREPARE
THEN THEN ;

We don’t bother looking for the recipe if there are no sprouts.

Another exception arises if any term is probably not true. By
eliminating such a condition first, you avoid having to try the other
conditions.

When multiple conditions have dissimilar weights (in likelihood or
calculation time) nest conditionals with the term that is least likely
to be true or easiest to calculate on the outside.

Trying to improve performance in this way is more difficult with the
construct. For instance, in the definition

: ?RISE PHONE RINGS? ALARM RINGS? OR IF UP GET THEN ;

we’re testing for the phone and the alarm, even though only one of them
needs to ring for us to get up. Now suppose it were much more difficult
to determine that the alarm clock was ringing. We could write

: ?RISE PHONE RINGS? IF UP GET ELSE ALARM-CLOCK RINGS? IF UP GET THEN
THEN ;

If the first condition is true, we don’t waste time evaluating the
second. We have to get up to answer the phone anyway.

The repetition of is ugly—not nearly as readable as the solution using
—but in some cases desirable.

Choosing Control Structures
---------------------------

The most elegant code is that which most closely matches the problem.
Choose the control structure that most closely matches the control-flow
problem.

Case Statements
~~~~~~~~~~~~~~~

A particular class of problem involves selecting one of several possible
paths of execution according to a numeric argument. For instance, we
want the word to take a number representing a suit of playing cards, 0
through 3, and display the name of the suit. We might define this word
using nested s, like this:

: .SUIT ( suit – ) DUP O= IF .“ HEARTS ” ELSE DUP 1 = IF .“ SPADES ”
ELSE DUP 2 = IF .“ DIAMONDS ” ELSE .“ CLUBS ” THEN THEN THEN DROP ;

We can solve this problem more elegantly by using a “case statement.”

Here’s the same definition, rewritten using the “ case statement”
format, named after Dr. , the gentleman who proposed it
:raw-latex:`\cite{eaker}`.

: .SUIT ( suit – ) CASE O OF .“ HEARTS ” ENDOF 1 OF .“ SPADES ” ENDOF 2
OF .“ DIAMONDS ” ENDOF 3 OF .“ CLUBS ” ENDOF ENDCASE ;

The case statement’s value lies exclusively in its readability and
writeability. There’s no efficiency improvement either in object memory
or in execution speed. In fact, the case statement compiles much the
same code as the nested statements. A case statement is a good example
of compile-time factoring.

Should all Forth systems include such a case statement? That’s a matter
of controversy. The problem is twofold. First, the instances in which a
case statement is actually needed are rare—rare enough to question its
value. If there are only a few cases, a nested construct will work as
well, though perhaps not as readably. If there are many cases, a
decision table is more flexible.

Second, many case-like problems are not quite appropriate for the case
structure. The case statement assumes that you’re testing for equality
against a number on the stack. In the instance of , we have contiguous
integers from zero to three. It’s more efficient to use the integer to
calculate an offset and directly jump to the right code.

In the case of our Tiny Editor, later in this chapter, we have not one,
but two, dimensions of possibilities. The case statement doesn’t match
that problem either.

Personally, I consider the case statement an elegant solution to a
misguided problem: attempting an algorithmic expression of what is more
aptly described in a decision table.

A case statement ought to be part of the application when useful, but
not part of the system.

Looping Structures
~~~~~~~~~~~~~~~~~~

The right looping structure can eliminate extra conditionals.

:

Many times conditionals are used to get out of loops. That particular
use can be avoided by having loops with multiple exit points.

This is a live topic, because of the multiple construct which is in
polyForth but hasn’t percolated up to Forth ’83. It’s a simple way of
defining multiple s in the same .

Also [of Forth, Inc.] has invented a new construct that introduces two
exit points to a . Given that construction you’ll have fewer tests. Very
often I leave a truth value on the stack, and if I’m leaving a loop
early, I change the truth value to remind myself that I left the loop
early. Then later I’ll have an to see whether I left the loop early, and
it’s just clumsy.

Once you’ve made a decision, you shouldn’t have to make it again. With
the proper looping constructs you won’t need to remember where you came
from, so more conditionals will go away.

This is not completely popular because it’s rather unstructured. Or
perhaps it is elaborately structured. The value is that you get simpler
programs. And it costs nothing.

Indeed, this is a live topic. As of this writing it’s too early to make
any specific proposals for new loop constructs. Check your system’s
documentation to see what it offers in the way of exotic looping
structures. Or, depending on the needs of your application, consider
adding your own conditional constructs. It’s not that hard in Forth.

I’m not even sure whether this use of multiple exits doesn’t violate the
doctrine of structured programming. In a loop with multiple s, all the
exits bring you to a common “continue” point: the . But with ’s
construct, you can exit the loop by jumping *past* the end of the loop,
continuing at an . There are two possible “continue” points.

This is “less structured,” if we can be permitted to say that. And yet
the definition will always conclude at its semicolon and return to the
word that invoked it. In that sense it is well-structured; the module
has one entry point and one exit point.

When you want to execute special code only if you did *not* leave the
loop prematurely, this approach seems the most natural structure to use.
(We’ll see an example of this in a later section, “Using Structured
Exits.”)

Favor counts over terminators.

Forth handles strings by saving the length of the string in the first
byte. This makes it easier to type, move, or do practically anything
with the string. With the address and count on the stack, the definition
of can be coded:

: TYPE ( a #) OVER + SWAP DO I C@ EMIT LOOP ;

(Although really ought to be written in machine code.)

This definition uses no overt conditional. actually hides the
conditional since each loop checks the index and returns to if it has
not yet reached the limit.

If a delimiter were used, let’s say ASCII null (zero), the definition
would have to be written:

: TYPE ( a) BEGIN DUP C@ ?DUP WHILE EMIT 1+ REPEAT DROP ;

An extra test is needed on each pass of the loop. ( is a conditional
operator.)

Optimization note: The use of in this solution is expensive in terms of
time because it contains an extra decision itself. A faster definition
would be:

: TYPE ( a) BEGIN DUP C@ DUP WHILE EMIT 1+ REPEAT 2DROP ;

The ’83 Standard applied this principle to which now accepts a count
rather than looking for a terminator.

The flip side of this coin is certain data structures in which it’s
easiest to *link* the structures together. Each record points to the
next (or previous) record. The last (or first) record in the chain can
be indicated with a zero in its link field.

If you have a link field, you have to fetch it anyway. You might as well
test for zero. You don’t need to keep a counter of how many records
there are. If you decrement a counter to decide whether to terminate,
you’re making more work for yourself. (This is the technique used to
implement Forth’s dictionary as a linked list.)

Calculating Results
~~~~~~~~~~~~~~~~~~~

Don’t decide, calculate.

Many times conditional control structures are applied mistakenly to
situations in which the difference in outcome results from a difference
in numbers. If numbers are involved, we can calculate them. (In Chapter
Four see the section called “Calculations vs. Data Structures vs.
Logic.”)

Use booleans as hybrid values.

This is a fascinating corollary to the previous tip, “Don’t decide,
calculate.” The idea is that booleans, which the computer represents as
numbers, can efficiently be used to effect numeric decisions. Here’s one
example, found in many Forth systems:

: S>D ( n – d)  sign extend s to d DUP O< IF -1 ELSE O THEN ;

(The purpose of this definition is to convert a single-length number to
double-length. A double-length number is represented as two 16-bit
values on the stack, the high-order part on top. Converting a positive
integer to double-length merely means adding a zero onto the stack, to
represent its high-order part. But converting a negative integer to
double-length requires “sign extension;” that is, the high-order part
should be all ones.)

The above definition tests whether the single-length number is negative.
If so, it pushes a negative one onto the stack; otherwise a zero. But
notice that the outcome is merely arithmetic; there’s no change in
process. We can take advantage of this fact by using the boolean itself:

: S>D ( n – d)  sign extend s to d DUP O< ;

This version pushes a zero or negative one onto the stack without a
moment’s (in)decision.

(In pre-1983 systems, the definition would be:

: S>D ( n – d)  sign extend s to d DUP O< NEGATE ;

See .)

We can do even more with “hybrid values”:

To effect a decision with a numeric outcome, use .

In the case of a decision that produces either zero or a non-zero
“:math:`n`,” the traditional phrase

( ? ) IF n ELSE O THEN

is equivalent to the simpler statement

( ? ) n AND

Again, the secret is that “true” is represented by :math:`-1` (all ones)
in ’83 Forth systems. ing “:math:`n`” with the flag will either produce
“:math:`n`” (all bits intact) or “:math:`0`” (all bits cleared).

To restate with an example:

( ? ) IF 200 ELSE O THEN

is the same as

( ? ) 200 AND

Take a look at this example:

n a b < IF 45 + THEN

This phrase either adds 45 to “:math:`n`” or doesn’t, depending on the
relative sizes of “:math:`a`” and “:math:`b`.” Since “adding 45 or not”
is the same as “adding 45 or adding 0,” the difference between the two
outcomes is purely numeric. We can rid ourselves of a decision, and
simply compute:

n a b < 45 AND +

:

The “” is faster than the , and certainly more graceful. It’s simpler.
If you form a habit of looking for instances where you’re calculating
this value from that value, then usually by doing arithmetic on the
logic you get the same result more cleanly.

I don’t know what you call this. It has no terminology; it’s merely
doing arithmetic with truth values. But it’s perfectly valid, and
someday boolean algebra and arithmetic expressions will accommodate it.

In books you often see a lot of piece-wise linear approximations that
fail to express things clearly. For instance the expression

x = O for t < O x = 1 for t &(&ge&) O

This would be equivalent to

t O< 1 AND

as a single expression, not a piece-wise expression.

I call these flags “hybrid values” because they are booleans (truth
values) being applied as data (numeric values). Also, I don’t know what
else to call them.

We can eliminate numeric clauses as well (where both results are
non-zero), by factoring out the difference between the two results. For
instance,

: STEPPERS ’TESTING? @ IF 150 ELSE 151 THEN LOAD ;

can be simplified to

: STEPPERS 150 ’TESTING? @ 1 AND + LOAD ;

This approach works here because conceptually we want to either load
Screen 150, or if testing, the next screen past it.
