The Problem With Variables
==========================

Although we handle data of immediate interest on the stack, we depend on
much information tucked away in variables, ready for recurring access. A
piece of code can change the contents of a variable without necessarily
having to know anything about how that data will be used, who will use
it, or when and if it will be used. Another piece of code can fetch the
contents of a variable and use it without knowing where that value came
from.

For every word that pushes a value onto the stack, another word must
consume that value. The stack gives us point-to-point communication,
like the post office.

Variables, on the other hand, can be set by any command and accessed any
number of times—or not at all—by any command. Variables are available
for anyone who cares to look—like graffiti.

Thus variables can be used to reflect the current state of affairs.

Using currentness can simplify problems. In the Roman numeral example of
, we used the variable to represent the current decimal-place; the words
, , and depended on this information to determine which type of symbol
to display. We didn’t have to specify both descriptions every time, as
in , , etc.

On the other hand, currentness adds a new level of complexity. To make
something current we must first define a variable or some type of data
structure. We also must remember to initialize it, if there’s any chance
that part of our code will refer to it before another part has had a
chance to set it.

A more serious problem with variables is that they are not “reentrant.”
On a multi-tasked Forth system, each task which requires local variables
must have its own copies. Forth’s variables serve this purpose. (See
*Starting Forth*, Chapter Nine, “Forth Geography.”)

Even within a single task, a definition that refers to a variable is
harder to test, verify, and reuse in a different situation than one in
which arguments are passed via the stack.

Suppose we are implementing a word-processor editor. We need a routine
that calculates the number of characters between the current cursor
position and the previous carriage-return/line-feed sequence. So we
write a word that employs a starting at the current position () and
ending at the zeroth position, searching for the line feed character.

Once the loop has found the character sequence, we subtract its relative
address from our current cursor position

its-position CURSOR @ SWAP -

to determine the distance between them.

Our word’s stack effect is:

( – distance-to-previous-cr/lf)

But in later coding we find we need a similar word to compute the
distance from an arbitrary character—\ *not* the current cursor
position—to the first previous line-feed character. We end up factoring
out the “” and allowing the starting address to be passed as an argument
on the stack, resulting in:

( starting-position – distance-to-previous-cr/lf)

By factoring-out the reference to the variable, we made the definition
more useful.

Unless it involves cluttering up the stack to the point of
unreadability, try to pass arguments via the stack rather than pulling
them out of variables.

:

Most of the modularity of Forth comes from designing and treating Forth
words as “functions” in the mathematical sense. In my experience a Forth
programmer usually tries quite hard to avoid defining any but the most
essential global variables (I have a friend who has the sign “Help stamp
out variables” above his desk), and tries to write words with what is
called “referential transparency,” i.e., given the same stack inputs a
word will always give the same stack outputs regardless of the more
global context in which it is executed.

In fact this property is exactly what we use when we test words in
isolation. Words that do not have this property are significantly harder
to test. In a sense a “named variable” whose value changes frequently is
the next worst thing to the now “forbidden” GOTO.

.. figure:: img7-211.png
   :alt: ``Shot from a cannon on a fast-moving train,
   hurtling between the blades of a windmill, and expecting to grab a
   trapeze dangling from a hot-air balloon\dots{} I told you Ace, there were


       ``Shot from a cannon on a fast-moving train,
    hurtling between the blades of a windmill, and expecting to grab a
    trapeze dangling from a hot-air balloon\dots{} I told you Ace, there were
    too many variables!''

Earlier we suggested the use of local variables especially during the
design phase, to eliminate stack traffic. It’s important to note that in
doing so, the variables were referred to only within the one definition.
In our example, receives four arguments from the stack and immediately
loads them into local variables for its own use. The four variables are
not referred to outside of this definition, and the word behaves safely
as a function.

Programmers unaccustomed to a language in which data can be passed
implicitly don’t always utilize the stack as fully as they should.
suggests the reason may be that beginning Forth users don’t trust the
stack :raw-latex:`\cite{ham83}`. He admits to initially feeling safer
about storing values into variables than leaving them on the stack. “No
telling *what* might happen with all that thrashing about on the stack,”
he felt.

It took some time for him to appreciate that “if words keep properly to
themselves, using the stack only for their expected input and output and
cleaning up after themselves, they can be looked upon as sealed systems
… I could put the count on the stack at the beginning of the loop, go
through the complete routine for each group, and at the end the count
would emerge, back on top of the stack, not a hair out of place.”
