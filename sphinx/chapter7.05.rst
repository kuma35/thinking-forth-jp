Saving and Restoring a State
============================

Variables have the characteristic that when you change their contents,
you clobber the value that was there before. Let’s look at some of the
problems this can create, and some of the things we can do about them.

is a variable that indicates the current number radix for all numeric
input and output. The following words are commonly found in Forth
systems:

: DECIMAL 10 BASE ! ; : HEX 16 BASE ! ;

Suppose we’ve written a word that displays a “dump” of memory.
Ordinarily, we work in decimal mode, but we want the dump in
hexadecimal. So we write:

: DUMP ( a # ) HEX ... ( code for the dump) ... DECIMAL ;

This works—most of the time. But there’s a presumption that we want to
come back to decimal mode. What if it had been working in hexadecimal,
and wants to come back to hexadecimal? Before we change the base to , we
have to save its current value. When we’re done dumping, we restore it.

This means we have to tuck away the saved value temporarily, while we
format the dump. The return stack is one place to do this:

: DUMP ( a # ) BASE @ >R HEX ( code for dump) R> BASE ! ;

If things get too messy, we may have to define a temporary variable:

VARIABLE OLD-BASE : DUMP ( a # ) BASE @ OLD-BASE ! HEX ( code for dump )
OLD-BASE @ BASE ! ;

How quickly things get complicated.

In this situation, if both the current and the old version of a variable
belong only to your application (and not part of your system), and if
this same situation comes up more than once, apply a technique of
factoring:

: BURY ( a) DUP 2+ 2 CMOVE ; : EXHUME ( a) DUP 2+ SWAP 2 CMOVE ;

Then instead of defining two variables, such as and , define one
double-length variable:

2VARIABLE CONDITION

Use and to save and restore the original value:

: DIDDLE CONDITION BURY 17 CONDITION ! ( diddle ) CONDITION EXHUME ;

saves the “old” version of condition at .

You still have to be careful. Going back to our example, suppose you
decided to add the friendly feature of letting the user exit the dump at
any time by pressing the “escape” key. So inside the loop you build the
test for a key being pressed, and if so execute . But what happens?

The user starts in decimal, then types . He exits midway through and
finds himself, strangely, in hexadecimal.

In the simple case at hand, the best solution is to not use , but rather
a controlled exit from the loop (via , etc.) to the end of the
definition where is reset.

In very complex applications a controlled exit is often impractical, yet
many variables must somehow be restored to a natural condition.

responds to this example:

You really get tied up in a knot. You’re creating problems for yourself.
If I want a hex dump I say . If I want a decimal dump I say . I don’t
give the privilege of messing around with my environment.

There’s a philosophical choice between restoring a situation when you
finish and establishing the situation when you start. For a long time I
felt you should restore the situation when you’re finished. And I would
try to do that consistently everywhere. But it’s hard to define
“everywhere.” So now I tend to establish the state before I start.

If I have a word which cares where things are, it had better set them.
If somebody else changes them, they don’t have to worry about resetting
them.

There are more exits than there are entrances.

In cases in which I need to do the resetting before I’m done, I’ve found
it useful to have a single word (which I call ) to perform this
resetting. I invoke :

-  at the normal exit point of the application

-  at the point where the user may deliberately exit (just before )

-  at any point where a fatal error may occur, causing an abort.

Finally, when you encounter this situation of having to save/restore a
value, make sure it’s not just a case of bad factoring. For example,
suppose we have written:

: LONG 18 #HOLES ! ; : SHORT 9 #HOLES ! ; : GAME #HOLES @ O DO I HOLE
PLAY LOOP ;

The current is either or .

Later we decide we need a word to play *any* number of holes. So we
invoke making sure not to clobber the current value of :

: HOLES ( n) #HOLES @ SWAP #HOLES ! GAME #HOLES ! ;

Because we needed after we’d defined , it seemed to be of greater
complexity; we built around . But in fact—perhaps you see it
already—rethinking is in order:

: HOLES ( n) O DO I HOLE PLAY LOOP ; : GAME #HOLES @ HOLES ;

We can build around and avoid all this saving/restoring nonsense.
