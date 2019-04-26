For Further Thinking
====================

Design the components and describe the algorithm(s) necessary to
simulate shuffling a deck of cards. Your algorithm will produce an array
of numbers, 0–51, arranged in random order.

The special constraint of this problem, of course, is that no one card
may appear twice in the array.

You may assume you have a random-number generator called CHOOSE. It’s
stack argument is “:math:`n`”; it produces a random number between zero
and :math:`n-1` inclusive. (See the Handy Hint, Chapter Ten, *Starting
Forth*.)

Can you design the card-shuffling algorithm so that it avoids the
time-consuming burden of checking some undetermined number of slots on
each pass of the loop? Can you do so using only the one array?
