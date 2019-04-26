The Iterative Approach in Implementation
========================================

Earlier in the book we discussed the iterative approach, paying
particular attention to its impact on the design phase. Now that we’re
talking about implementation, let’s see how the approach is actually
used in writing code.

Work on only one aspect of a problem at a time.

Suppose we’re entrusted with the job of coding a word to draw or erase a
box at a given x–y coordinate. (This is the same problem we introduced
in the section called “Compile-Time Factoring.”)

At first we focus our attention on the problem of drawing a box—never
mind erasing it. We might come up with this:

: LAYER WIDE 0 DO ASCII \* EMIT LOOP ; : BOX ( upper-left-x upper-left-y
– ) HIGH 0 DO 2DUP I + XY LAYER LOOP 2DROP ;

Having tested this to make sure it works correctly, we turn now to the
problem of using the same code to *un*\ draw a box. The solution is
simple: instead of hard-coding the we’d like to change the emitted
character from an asterisk to a blank. This requires the addition of a
variable, and some readable words for setting the contents of the
variable. So:

VARIABLE INK : DRAW ASCII \* INK ! ; : UNDRAW BL INK ! ; : LAYER WIDTH 0
DO INK @ EMIT LOOP ;

The definition of , along with the remainder of the application, remains
the same.

This approach allows the syntax

( x y ) DRAW BOX

or

( x y ) UNDRAW BOX

By switching from an explicit value to a variable that contains a value,
we’ve added a level of indirection. In this case, we’ve added
indirection “backwards,” adding a new level of complexity to the
definition of without substantially lengthening the definition.

By concentrating on one dimension of the problem at a time, you can
solve each dimension more efficiently. If there’s an error in your
thinking, the problem will be easier to see if it’s not obscured by yet
another untried, untested aspect of your code.

Don’t change too much at once.

While you’re editing your application—adding a new feature or fixing
something—it’s often tempting to go and fix several other things at the
same time. Our advice: Don’t.

Make as few changes as you can each time you edit-compile. Be sure to
test the results of each revision before going on. You’d be amazed how
often you can make three innocent modifications, only to recompile and
have nothing work!

Making changes one at a time ensures that when it stops working, you
know why.

Don’t try to anticipate ways to factor too early.

Some people wonder why most Forth systems don’t include the definition
word . This rule is the reason.

:

I often have a class of things called arrays. The simplest array merely
adds a subscript to an address and gives you back an address. You can
define an array by saying

CREATE X 100 ALLOT

then saying

X +

Or you can say

: X X + ;

One of the problems that’s most frustrating for me is knowing whether
it’s worth creating a defining word for a particular data structure.
Will I have enough instances to justify it?

I rarely know in advance if I’m going to have more than one array. So I
don’t define the word .

After I discover I need two arrays, the question is marginal.

If I need three then it’s clear. Unless they’re different. And odds are
they will be different. You may want it to fetch it for you. You may
want a byte array, or a bit array. You may want to do bounds checking,
or store its current length so you can add things to the end.

I grit my teeth and say, “Should I make the byte array into a cell
array, just to fit the data structure into the word I already have
available?”

The more complex the problem, the less likely it will be that you’ll
find a universally applicable data structure. The number of instances in
which a truly complex data structure has found universal use is very
small. One example of a successful complex data structure is the Forth
dictionary. Very firm structure, great versatility. It’s used everywhere
in Forth. But that’s rare.

If you choose to define the word , you’ve done a decomposition step.
You’ve factored out the concept of an array from all the words you’ll
later back in. And you’ve gone to another level of abstraction.

Building levels of abstraction is a dynamic process, not one you can
predict.

Today, make it work. Tomorrow, optimize it.

Again . On the day of this interview, had been completing work on the
design of a board-level Forth computer, using commercially available
ICs. As part of his toolkit for designing the board, he created a
simulator in Forth, to test the board’s logic:

This morning I realized I’ve been mixing the descriptions of the chips
with the placement of the chips on the board. This perfectly convenient
for my purposes at the moment, but when I come up with another board
that I want to use the same chips for, I have arranged things very
badly.

I should have factored it with the descriptions here and the uses there.
I would then have had a chip description language. Okay. At the time I
was doing this I was not interested in that level of optimization.

Even if the thought had occurred to me then, I probably would have said,
“All right, I’ll do that later,” then gone right ahead with what I was
doing. Optimization wasn’t the most important thing to me at the time.

Of course I try to factor things well. But if there doesn’t seem to be a
good way to do something, I say, “Let’s just make it work.”

My motivation isn’t laziness, it’s knowing that there are other things
coming down the pike that are going to affect this decision in ways I
can’t predict. Trying to optimize this now is foolish. Until I get the
whole picture in front of me, I can’t know what the optimum is.

The observations in this section shouldn’t contradict what’s been said
before about information hiding and about anticipating elements that may
change. A good programmer continually tries to balance the expense of
building-in changeability against the expense of changing things later
if necessary.

These decisions take experience. But as a general rule:

Anticipate things-that-may-change by organizing information, not by
adding complexity. Add complexity only as necessary to make the current
iteration work.

Summary
-------

In this chapter we’ve discussed various techniques and criteria for
factoring. We also examined how the iterative approach applies to the
implementation phase.

9 , , and , *IBM Systems Journal*, vol. 13, no. 2, 1974, Copyright 1974
by International Business Machines Corporation. , “The Magical Number
Seven, Plus or Minus Two: Some Limits on our Capacity for Processing
Information,” *Psychol. Rev*., vol. 63, pp. 81-97, Mar. 1956. ,
“Definition Field Address Conversion Operators,” *Forth–83 Standard*,
Forth Standards Team.
