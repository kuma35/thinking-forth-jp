Factoring Criteria
==================

Armed with an understanding of factoring techniques, let’s now discuss
several of the criteria for factoring Forth definitions. They include:

#. Limiting the size of definitions

#. Limiting repetition of code

#. Nameability

#. Information hiding

#. Simplifying the command interface

Keep definitions short.

We asked , “How long should a Forth definition be?”

A word should be a line long. That’s the target.

When you have a whole lot of words that are all useful in their own
right—perhaps in debugging or exploring, but inevitably there’s a reason
for their existence—you feel you’ve extracted the essence of the problem
and that those words have expressed it.

Short words give you a good feeling.

An informal examination of one of ’s applications shows that he averages
seven references, including both words and numbers, per definition.
These are remarkably short definitions. (Actually, his code was divided
about 50–50 between one-line and two-line definitions.)

Psychological tests have shown that the human mind can only focus its
conscious attention on seven things, plus or minus two, at a time
:raw-latex:`\cite{miller56}`. Yet all the while, day and night, the vast
resources of the mind are subconsciously storing immense amounts of
data, making connections and associations and solving problems.

Even if out subconscious mind knows each part of an application inside
out, our narrow-viewed conscious mind can only correlate seven elements
of it at once. Beyond that, our grasp wavers. Short definitions match
our mental capabilities.

Something that tempts many Forth programmers to write overly long
definitions is the knowledge that headers take space in the dictionary.
The coarser the factoring, the fewer the names, and the less memory that
will be wasted.

It’s true that more memory will be used, but it’s hard to say that
anything that helps you test, debug and interact with your code is a
“waste.” If your application is large, try using a default width of
three, with the ability to switch to a full-length name to avoid a
specific collision. (“Width” refers to a limit on the number of
characters stored in the name field of each dictionary header.)

If the application is still too big, switch to a Forth with multiple
dictionaries on a machine with extended memory, or better yet, a 32-bit
Forth on a machine with 32-bit addressing.

A related fear is that over-factoring will decrease performance due to
the overhead of Forth’s inner interpreter. Again, it’s true that there
is some penalty for each level of nesting. But ordinarily the penalty
for extra nesting due to proper factoring will not be noticeable. If you
timings are that tight, the real solution is to translate something into
assembler.

Factor at the point where you feel unsure about your code (where
complexity approaches the conscious limit).

Don’t let your ego take over with an “I can lick this!” attitude. Forth
code should never feel uncomfortably complex. Factor!

:

Feeling like you might have introduced a bug is one reason for
factoring. Any time you see a doubly-nested , that’s a sign that
something’s wrong because it will be hard to debug. Almost always take
the inner and make a word.

And having factored out a word for testing, there’s no reason for
putting it back. You found it useful in the first place. There’s no
guarantee you won’t need it again.

Here’s another facet of the same principle:

Factor at the point where a comment seems necessary

Particularly if you feel a need to remind yourself what’s on the stack,
this may be a good time to “make a break.”

Suppose you have

... BALANCE DUP xxx xxx xxx xxx xxx xxx xxx xxx xxx xxx xxx xxx xxx xxx
xxx ( balance) SHOW ...

which begins by computing the balance and ends by displaying it. In the
meantime, several lines of code use the balance for purposes of their
own. Since it’s difficult to see that the balance is still on the stack
when executes, the programmer has interjected a stack picture.

This solution is generally a sign of bad factoring. Better to write:

: REVISE ( balance – ) xxx xxx xxx xxx xxx xxx xxx xxx xxx xxx xxx xxx
xxx xxx ; ... BALANCE DUP REVISE SHOW ...

No narrative stack pictures are needed. Furthermore, the programmer now
has a reusable, testable subset of the definition.

Limit repetition of code.

The second reason for factoring, to eliminate repeated fragments of
code, is even more important than reducing the size of definitions.

:

When a word is just a piece of something, it’s useful for clarity or
debugging, but not nearly as good as a word that is used multiple times.
Any time a word is used only once you want to question its value.

Many times when a program has gotten too big I will go back through it
looking for phrases that strike my eye as candidates for factoring. The
computer can’t do this; there are too many variables.

In looking over your work, you often find identical phrases or short
passages duplicated several times. In writing an editor I found this
phrase repeated several times:

FRAME CURSOR @ +

Because it appeared several times I factored it into a new word called .

It’s up to you to recognize fragments that are coded differently but
functionally equivalent, such as:

FRAME CURSOR @ 1- +

The appears to make this phrase different from the one defined as . But
in fact, it can be written

AT 1-

On the other hand:

When factoring out duplicate code, make sure the factored code serves a
single purpose.

Don’t blindly seize upon duplications that may not be useful. For
instance, in several places in one application I used this phrase:

BLK @ BLOCK >IN @ + C@

I turned it into a new word and called it , since it returned the letter
being pointed to by the interpreter.

In a later revision, I unexpectedly had to write:

BLK @ BLOCK >IN @ + C!

I could have used the existing were it not for its at the end. Rather
than duplicate the bulk of the phrase in the new section, I chose to
refactor to a finer resolution, taking out the . The usage was then
either or . This change required me to search through the listing
changing all instances of to . But I should have done that in the first
place, separating the computation of the letter’s address from the
operation to be performed on the address.

Similar to our injunction against repetition of code:

Look for repetition of patterns.

If you find yourself referring back in the program to copy the pattern
of previously-used words, then you may have mixed in a general idea with
a specific application. The part of the pattern you are copying perhaps
can be factored out as an independent definition that can be used in all
the similar cases.

Be sure you can name what you factor.

:

If you have a concept that you can’t assign a single name to, not a
hyphenated name, but a name, it’s not a well-formed concept. The ability
to assign a name is a necessary part of decomposition. Certainly you get
more confidence in the idea.

Compare this view with the criteria for decomposing a module espoused by
structured design in . According to that method, a module should exhibit
“functional binding,” which can be verified by describing its function
in a single, non-compound, *sentence*. Forth’s “atom,” a *name*, is an
order of magnitude more refined.

Factor definitions to hide details that may change.

We’ve seen the value of information hiding in earlier chapters,
especially with regard to preliminary design. It’s useful to remember
this criterion during the implementation stage as well.

Here’s a very short definition that does little except hide information:

: >BODY ( acf – apf ) 2+ ;

This definition allows you to convert an acf (address of code field) to
an apf (address of parameter field) without depending on the actual
structure of a dictionary definition. If you were to use instead of the
word , you would lose transportability if you ever converted to a Forth
system in which the heads were separated from the bodies. (This is one
of a set of words suggested by , and included as an Experimental
Proposal in the Forth-83 Standard :raw-latex:`\cite{harris83}`.)

Here’s a group of definitions that might be used in writing an editor:

: FRAME ( – a) SCR @ BLOCK ; : CURSOR ( – a) R# ; : AT ( – a) FRAME
CURSOR @ + ;

These three definitions can form the basis for all calculations of
addresses necessary for moving text around. Use of these three
definitions completely separates your editing algorithms from a reliance
on Forth blocks.

What good is that? If you should decide, during development, to create
an editing buffer to protect the user from making errors that destroy a
block, you merely have to redefine two of these words, perhaps like
this:

CREATE FRAME 1024 ALLOT VARIABLE CURSOR

The rest of your code can remain intact.

Factor functions out of definitions that display results.

This is really a question of decomposition.

Here’s an example. The word defined below, pronounced “people-to-paths,”
computes how many paths of communication there are between a given
number of people in a group. (This is a good thing for managers of
programmer teams to know—the number of communication paths increases
drastically with each new addition to the team.)

: PEOPLE>PATHS ( #people – #paths ) DUP 1- \* 2/ ;

This definition does the calculation only. Here’s the “user definition”
that invokes to perform the calculation, and then displays the result:

: PEOPLE ( #people) .“ = ” PEOPLE>PATHS . .“ PATHS ” ;

This produces:

2 PEOPLE&underline = 1 PATHS 3 PEOPLE&underline = 3 PATHS 5
PEOPLE&underline = 10 PATHS 10 PEOPLE&underline = 45 PATHS

Even if you think you’re going to perform a particular calculation only
once, to display it in a certain way, believe me, you’re wrong. You will
have to come back later and factor out the calculation part. Perhaps
you’ll need to display the information in a right-justified column, or
perhaps you’ll want to record the results in a data base—you never know.
But you’ll always have to factor it, so you might as well do it right
the first time. (The few times you might get away with it aren’t worth
the trouble.)

The word (dot) is a prime example. Dot is great 99% of the time, but
occasionally it does too much. Here’s what it does, in fact (in
Forth–83):

: . ( n ) DUP ABS 0 <# #S ROT SIGN #> TYPE SPACE ;

But suppose you want to convert a number on the stack into an ASCII
string and store it in a buffer for typing later. Dot converts it, but
also types it. Or suppose you want to format playing cards in the form
(for “ten of clubs”). You can’t use dot to display the 10 because it
prints a final space.

Here’s a better factoring found in some Forth systems:

: (.) ( n – a #) DUP ABS 0 <# #S ROT SIGN #> ; : . ( n) (.) TYPE SPACE ;

We find another example of failing to factor the output function from
the calculation function in our own Roman numeral example in . Given our
solution, we can’t store a Roman numeral in a buffer or even center it
in a field. (A better approach would have been to use instead of .)

Information hiding can also be a reason *not* to factor. For instance,
if you factor the phrase

SCR @ BLOCK

into the definition

: FRAME SCR @ BLOCK ;

remember you are doing so only because you may want to change the
location of the editing frame. Don’t blindly replace all occurrences of
the phrase with the new word because you may change the definition of
and there will certainly be times when you really want .

If a repeated code fragment is likely to change in some cases but not
others, factor out only those instances that might change. If the
fragment is likely to change in more than one way, factor it into more
than one definition.

Knowing when to hide information requires intuition and experience.
Having made many design changes in your career, you’ll learn the hard
way which things will be most likely to change in the future.

You can never predict everything, though. It would be useless to try, as
we’ll see in the upcoming section called “The Iterative Approach in
Implementation.”

Simplify the command interface by reducing the number of commands.

It may seem paradoxical, but good factoring can often yield *fewer*
names. In we saw how six simple names (, , , , , and ) could do the work
of eight badly-factored, hyphenated names.

As another example, I found two definitions circulating in one
department in which Forth had recently introduced. Their purpose was
purely instructional, to remind the programmer which vocabulary was ,
and which was :

: .CONTEXT CONTEXT @ 8 - NFA ID. ; : .CURRENT CURRENT @ 8 - NFA ID. ;

If you typed

.CONTEXT

the system would respond

.CONTEXT&underline FORTH

(They worked—at least on the system used there—by backing up to the name
field of the vocabulary definition, and displaying it.)

The obvious repetition of code struck my eye as a sign of bad factoring.
It would have been possible to consolidate the repeated passage into a
third definition:

: .VOCABULARY ( pointer ) @ 8 - NFA ID. ;

shortening the original definitions to:

: .CONTEXT CONTEXT .VOCABULARY ; : .CURRENT CURRENT .VOCABULARY ;

But in this approach, the only difference between the two definitions
was the pointer to be displayed. Since part of good factoring is to make
fewer, not more definitions, it seemed logical to have only one
definition, and let it take as an argument either the word or the word .

Applying the principles of good naming, I suggested:

: IS ( adr) @ 8 - NFA ID. ;

allowing the syntax

CONTEXT IS&underline ASSEMBLER ok

or

CURRENT IS&underline FORTH ok

The initial clue was repetition of code, but the final result came from
attempting to simplify the command interface.

Here’s another example. The IBM PC has four modes four displaying text
only:

    40 column monochrome

    40 column color

    80 column monochrome

    80 column color

The word is available in the Forth system I use. takes an argument
between 0 and 3 and changes the mode accordingly. Of course, the phrase
or doesn’t help me remember which mode is which.

Since I need to switch between these modes in doing presentations, I
need to have a convenient set of words to effect the change. These words
must also set a variable that contains the current number of columns—40
or 80.

Here’s the most straightforward way to fulfill the requirements:

: 40-B&W 40 #COLUMNS ! 0 MODE ; : 40-COLOR 40 #COLUMNS ! 1 MODE ; :
80-B&W 80 #COLUMNS ! 2 MODE ; : 80-COLOR 80 #COLUMNS ! 3 MODE ;

By factoring to eliminate the repetition, we come up with this version:

: COL-MODE! ( #columns mode ) MODE #COLUMNS ! ; : 40-B&W 40 0 COL-MODE!
; : 40-COLOR 40 1 COL-MODE! ; : 80-B&W 80 2 COL-MODE! ; : 80-COLOR 80 3
COL-MODE! ;

But by attempting to reduce the number of commands, and also by
following the injunctions against numerically-prefixed and hyphenated
names, we realize that we can use the number of columns as a stack
argument, and *calculate* the mode:

: B&W ( #cols – ) DUP #COLUMNS ! 20 / 2- MODE ; : COLOR ( #cols – ) DUP
#COLUMNS ! 20 / 2- 1+ MODE ;

This gives us this syntax:

40 B&W 80 B&W 40 COLOR 80 COLOR

We’ve reduced the number of commands from four to two.

Once again, though, we have some duplicate code. If we factor out this
code we get:

: COL-MODE! ( #columns chroma?) SWAP DUP #COLUMNS ! 20 / 2- + MODE ; :
B&W ( #columns – ) 0 COL-MODE! ; : COLOR ( #columns – ) 1 COL-MODE! ;

Now we’ve achieved a nicer syntax, and at the same time greatly reduced
the size of the object code. With only two commands, as in this example,
the benefits may be marginal. But with larger sets of commands the
benefits increase geometrically.

Our final example is a set of words to represent colors on a particular
system. Names like and are nicer than numbers. One solution might be to
define:

0 CONSTANT BLACK 1 CONSTANT BLUE 2 CONSTANT GREEN 3 CONSTANT CYAN 4
CONSTANT RED 5 CONSTANT MAGENTA 6 CONSTANT BROWN 7 CONSTANT GRAY 8
CONSTANT DARK-GRAY 9 CONSTANT LIGHT-BLUE 10 CONSTANT LIGHT-GREEN 11
CONSTANT LIGHT-CYAN 12 CONSTANT LIGHT-RED 13 CONSTANT LIGHT-MAGENTA 14
CONSTANT YELLOW 15 CONSTANT WHITE

These colors can be used with words such as , , and :

WHITE BACKGROUND RED FOREGROUND BLUE BORDER

But this solution requires 16 names, and many of them are hyphenated. Is
there a way to simplify this?

We notice that the colors between 8 and 15 are all “lighter” versions of
the colors between 0 and 7. (In the hardware, the only difference
between these two sets is the setting of the “intensity bit.”) If we
factor out the “lightness,” we might come up with this solution:

VARIABLE ’LIGHT? ( intensity bit?) : HUE ( color) CREATE , DOES> ( –
color ) @ ’LIGHT? @ OR 0 ’LIGHT? ! ; 0 HUE BLACK 1 HUE BLUE 2 HUE GREEN
3 HUE CYAN 4 HUE RED 5 HUE MAGENTA 6 HUE BROWN 7 HUE GRAY : LIGHT 8
’LIGHT? ! ;

With this syntax, the word

BLUE

by itself will return a “1” on the stack, but the phrase

LIGHT BLUE

will return a “9.” (The adjective sets flag which is used by the hues,
then cleared.)

If necessary for readability, we still might want to define:

8 HUE DARK-GRAY 14 HUE YELLOW

Again, through this approach we’ve achieved a more pleasant syntax and
shorter object code.

Don’t factor for the sake of factoring. Use clichés.

The phrase

OVER + SWAP

may be seen commonly in certain applications. (It converts an address
and count into an ending address and starting address appropriate for a
.)

Another commonly seen phrase is

1+ SWAP

(It rearranges a first-number and last-number into the
last-number-plus-one and first-number order required by .)

It’s a little tempting to seize upon these phrases and turn them into
words, such as (for the first phrase) .

:

That particular phrase [] is one that’s right on the margin of being a
useful word. Often, though, if you define something as a word, it turns
out you use it only once. If you name such a phrase, you have trouble
knowing exactly what does. You can’t see the manipulation in your mind.
has greater mnemonic value than .

I call these phrases “clichés.” They stick together as meaningful
functions. You don’t have to remember how the phrase works, just what it
does. And you don’t have to remember an extra name.
