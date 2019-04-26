Choosing Names: The Art
=======================

Besides a mathematical inclination, an exceptionally good mastery of
one’s native tongue is the most vital asset of a competent programmer
*(Prof. :raw-latex:`\cite{dijkstra82}`).*

We’ve talked about the significance of using names to symbolize ideas
and objects in the application. The choosing of names turns out to be an
important part of the design process.

Newcomers tend to overlook the important of names. “After all,” they
think, “the computer doesn’t care what names I choose.”

But good names are essential for readability. Moreover, the mental
exercise of summoning a one-word description bears a synergistic effect
on your perceptions of what the entity should or should not do.

Here are some rules for choosing good names:

Choose names according to “what,” not “how.”

A definition should hide the complexities of implementation from other
definitions which invoke it. The name, too, should hide the details of
the procedure, and instead should describe the outward appearance or net
effect.

For instance, the Forth word simply increments the dictionary pointer
(called or in most systems). But the name is better than because the
user is thinking of reserving space, not incrementing a pointer.

The ’83 Standard adopted the name instead of the previous name for the
same function, . The operation makes it possible to copy a region of
memory *forward* into overlapping memory. It accomplishes this by
starting with the last byte and working *backward*. In the new name, the
forwardness of the “what” supersedes the backwardness of the “how.”

Find the most expressive word.

A powerful agent is the right word. Whenever we come upon one of those
intensely right words in a book or a newspaper the resulting effect is
physical as well as spiritual, and electrically prompt *().*

The difference between the right word and the almost-right word is like
the difference between lightning and the lightning bug *().*

Suit the action to the word, the word to the action *(, Hamlet,
Act III).*

, a Forth consultant and author, suggests that the most important Forth
development tool is a good thesaurus :raw-latex:`\cite{laxen}`.

Sometimes you’ll think of an adequate word for a definition, but it
doesn’t feel quite right. It may be months later before you realize that
you fell short of the mark. In the Roman numeral example in , there’s a
word that handles the exception case: numbers that are one-less-than the
next symbol’s value. My first choice was . That’s awkward, but it was
much later that I thought of .

Most fig-Forth systems include the word , which lists the names of all
the words in the current vocabulary. After many years someone realized
that a nicer name is . Not only does sound more pleasant by itself, it
also works nicely with vocabulary names. For instance:

EDITOR WORDS

or

ASSEMBLER WORDS

On the other hand, points out that inappropriate names can become a
simple technique for encryption. If you need to provide security when
you’re forced to distribute source, you can make your code very
unreadable by deliberately choosing misleading names. Of course,
maintenance becomes impossible.

Choose names that work in phrases.

Faced with a definition you don’t know what to call, think about how the
word will be used in context. For instance:

SHUTTER OPEN OPEN is the appropriate name for a word that sets a bit in
an I/O address identified with the name SHUTTER.&medskip 3 BUTTON DOES
IGNITION DOES is a good choice for a word that vectors the address of
the function IGNITION into a table of functions, so that IGNITION will
be executed when Button 3 is pushed.&medskip SAY HELLO SAY is the
perfect choice for vectoring HELLO into an execution variable. (When I
first wrote this example for Starting &Forth, I called it VERSION.
&personMoore reviewed the manuscript and suggested SAY, which is clearly
much better.)&medskip I’M HARRY The word I’M seems more natural than
LOGON HARRY, LOGIN HARRY or SESSION HARRY, as often seen.

     

    is the appropriate name for a word that sets a bit in an I/O address
    identified with the name .

     

    is a good choice for a word that vectors the address of the function
    into a table of functions, so that will be executed when Button 3 is
    pushed.

     

    is the perfect choice for vectoring into an execution variable.
    (When I first wrote this example for Starting Forth, I called it .
    reviewed the manuscript and suggested , which is clearly much
    better.)

     

    The word seems more natural than , or , as often seen.

The choice of is another invention of , who says:

I detest the word . There is no such word in English. I was looking for
a word that said, “I’m …” It was a natural. I just stumbled across it.
Even though it’s clumsy with that apostrophe, it has that sense of
rightness.

All these little words are the nicest way of getting the “Aha!”
reaction. If you think of the right word, it is *obviously* the right
word.

If you have a wide recall vocabulary, you’re in a better position to
come up with the right word.

Another of ’s favorite words is , which he uses as an array indexing
word. For instance, the phrase

5 TH

returns the address of the “fifth” element of the array.

Spell names in full.

I once saw some Forth code published in a magazine in which the author
seemed hell-bent on purging all vowels from his names, inventing such
eyesores as for “display buffer.” Other writers seem to think that three
characters magically says it all, coining for “length.” Such practices
reflect thinking from a bygone age.

Forth words should be fully spelled out. Feel proud to type every letter
of or or . These are the words you mean. The worst problem with
abbreviating a word is that you forget just how you abbreviated it. Was
that or

Another problem is that abbreviations hinder readability. Any
programming language is hard enough to read without compounding the
difficulty.

Still, there are exceptions. Here are a few:

#. Words that you use extremely frequently in code. Forth employs a
   handful of commands that get used over and over, but have little or
   no intrinsic meaning:

   : ; @ ! . ,

   But there are so few of them, and they’re used so often, they become
   old friends. I would never want to type, on a regular basis,

   DEFINE END-DEFINITION FETCH STORE PRINT COMPILE#

   (Interestingly, most of these symbols don’t have English
   counterparts. We use the phrase “*colon* definition” because there’s
   no other term; we say “*comma* a number into the dictionary” because
   it’s not exactly compiling, and there’s no other term.)

#. Words that a terminal operator might use frequently to control an
   operation. These words should be spelled as single letters, as are
   line editor commands.

#. Words in which familiar usage implies that they be abbreviated. Forth
   assembler mnemonics are typically patterned after the manufacturer’s
   suggested mnemonics, which are abbreviations (such as and ).

Your names should be pronounceable; otherwise you may regret it when you
try to discuss the program with other people. If the name is symbolic,
invent a pronunciation (e.g., is called “to-r”; is called “r-from”).

Favor short words.

Given the choice between a three-syllable word and a one-syllable word
that means the same thing, choose the shorter. is a better name than .
is a better name than ; , , or may be better still.

Shorter names are easier to type. They save space in the source screen.
Most important, they make your code crisp and clean.

Hyphenated names may be a sign of bad factoring.

:

There are diverging programming styles in the Forth community. One uses
hyphenated words that express in English what the word is doing. You
string these big long words together and you get something that is quite
readable.

But I immediately suspect that the programmer didn’t think out the words
carefully enough, that the hyphen should be broken and the words defined
separately. That isn’t always possible, and it isn’t always
advantageous. But I suspect a hyphenated word of mixing two concepts.

Compare the following two strategies for saying the same thing:

ENABLE-LEFT-MOTOR LEFT MOTOR ON ENABLE-RIGHT-MOTOR RIGHT MOTOR ON
DISABLE-LEFT-MOTOR LEFT MOTOR OFF DISABLE-RIGHT-MOTOR RIGHT MOTOR OFF
ENABLE-LEFT-SOLENOID LEFT SOLENOID ON ENABLE-RIGHT-SOLENOID RIGHT
SOLENOID ON DISABLE-LEFT-SOLENOID LEFT SOLENOID OFF
DISABLE-RIGHT-SOLENOID RIGHT SOLENOID OFF

The syntax on the left requires eight dictionary entries; the syntax on
the right requires only six-and some of the words are likely to be
reused in other parts of the application. If you had a motor and
solenoid as well, you’d need only seven words to describe sixteen
combinations.

Don’t bundle numbers into names.

Watch out for a series of names beginning or ending with numbers, such
as , , , etc.

This bundling of names and numbers may be an indication of bad
factoring. The crime is similar to hyphenation, except that what should
be factored out is a number, not a word. A better factoring of the above
would be

1 CHANNEL 2 CHANNEL 3 CHANNEL

In this case, the three words were reduced to one.

Often the bundling of names and numbers indicates fuzzy naming. In the
above case, more descriptive names might indicate the purpose of the
channels, as in

VOICE , TELEMETRY , GUITAR

We’ll amplify on these ideas in the next chapter on “Factoring.”
