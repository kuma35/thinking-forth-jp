Sharing Components
==================

It’s legal to use a component for an additional purpose besides its
intended one, provided:

#. All uses of the component are mutually exclusive

#. Each interrupting use of the component restores the component to its
   previous state when finished.

Otherwise you need an additional component or level of complexity.

We’ve seen a simple example of this principle with the return stack. The
return stack is a component of the Forth system designed to hold return
addresses, and thereby serve as an indication of where you’ve been and
where you’re going. To use the return stack as a holder for temporary
values is possible, and in many cases desirable. Problems occur when one
of the above restrictions is ignored.

In my text formatter the output can go invisible. This feature has two
purposes:

#. for looking ahead to see whether something will fit, and

#. for formatting the table of contents (the entire document is
   formatted and page numbers are calculated without anything actually
   being displayed).

It was tempting to think that once having added the ability to make the
output invisible, I could use this feature to serve both purposes.
Unfortunately, the two purposes are not mutually exclusive.

Let’s see what would happen if I tried to violate this rule. Imagine
that the word does the output, and it’s smart enough to know whether to
be visible or invisible. The words and set the state respectively.

My code for looking ahead will first execute then test-format the
upcoming text to determine its length, and finally execute to restore
things to the normal state.

This works fine.

Later I add the table-of-contents feature. First the code executes ,
then runs through the document determining page numbers etc.; then
finally executes to restore things to normal.

The catch? Suppose I’m running a table of contents and I hit one of
those places where I look ahead. When I finish looking ahead, I execute
. Suddenly I start printing the document when I was supposed to be
running the table of contents.

The solution? There are several.

One solution views the problem as being that the lookahead code is
clobbering the visible/invisible flag, which may have been preset by
table-of-contents. Therefore, the lookahead code should be responsible
for saving, and later restoring, the flag.

Another solution involves keeping two separate variables—one to indicate
we’re looking ahead, the other to indicate we’re printing the table of
contents. The word requires that both flags be false in order to
actually display anything.

There are two ways to accomplish the latter approach, depending on how
you want to decompose the problem. First, we could nest one condition
within the other:

: [DISPLAY] ... ( the original definition, always does the output) ... ;
VARIABLE ’LOOKAHEAD? ( t=looking-ahead) : <DISPLAY> ’LOOKAHEAD? @ NOT IF
[DISPLAY] THEN ; VARIABLE ’TOC? ( t=setting-table-of-contents) : DISPLAY
’TOC? @ NOT IF <DISPLAY> THEN ;

checks that we’re not setting the table of contents and invokes , which
in turn checks that we’re not looking ahead and invokes .

In the development cycle, the word that always does the output was
originally called . Then a new was defined to include the lookahead
check, and the original definition was renamed , thus adding a level of
complexity backward without changing any of the code that used .

Finally, when the table-of-contents feature was added, a new was defined
to include the table-of-contents check, and the previous was renamed .

That’s one approach to the use of two variables. Another is to include
both tests within a single word:

: DISPLAY ’LOOKAHEAD? @ ’TOC @ OR NOT IF [DISPLAY] THEN ;

But in this particular case, yet another approach can simplify the whole
mess. We can use a single variable not as a flag, but as a counter.

We define:

VARIABLE ’INVISIBLE? ( t=invisible) : DISPLAY ’INVISIBLE? @ O= IF
[DISPLAY] THEN ; : INVISIBLE 1 ’INVISIBLE? +! ; : VISIBLE -1 ’INVISIBLE?
+! ;

The lookahead code begins by invoking which bumps the counter up one.
Non-zero is “true,” so will not do the output. After the lookahead, the
code invokes which decrements the counter back to zero (“false”).

The table-of-contents code also begins with and ends with . If we’re
running the table of contents while we come upon a lookahead, the second
invocation of raises the counter to two.

The subsequent invocation of decrements the counter to one, so we’re
still invisible, and will remain invisible until the table of contents
has been run.

(Note that we must substitute for . The ’83 Standard has changed to mean
one’s complement, so that yields true. By the way, I think this was a
mistake.)

This use of a counter may be dangerous, however. It requires parity of
command usage: two s yields invisible. That is, unless clips the
counter:

: VISIBLE ’INVISIBLE? @ 1- O MAX ’INVISIBLE? ! ;
