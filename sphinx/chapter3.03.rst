Maintaining a Component-based Application
=========================================

How well will our design fare in the face of change? Envision the
following scenario:

We originally assumed that we could refresh the video display simply by
retyping the field every time a key is pressed. We even implemented the
code on our personal computer, with its memory-mapped video that
refreshes an entire line in the blink of a scan cycle. But now our
customer wants the application to run on a telephone-based network, with
all I/O being done at a not-so-fast baud rate. Since some of our input
fields are almost as wide as the video screen, maybe 65 characters, it
just takes too long to refresh the entire line on every key stroke.

We’ve got to change the application so that we only refresh that part of
the field that actually changes. In “insert” and “delete,” this would
mean the text to the right of the cursor. In “overwrite” it would mean
changing just the single character being overwritten.

This change is significant. The video refresh function, which we
cavalierly relegated to the key interpreter, now must depend on which
editing functions occur. As we’ve discovered, the most important names
needed to implement the key interpreter are:

FORWARD BACKWARD OVERWRITE INSERT DELETE INSERT<

None of their descriptions make any reference to the video refresh
process, because that was originally assumed to happen later.

But things aren’t as bad as they seem. Looking at it now, the process
could easily include a command to type the new character where the
terminal’s cursor is. And and could include commands to type everything
to the right of, and including, , then reset the terminal’s cursor to
its current position.

Here are our revised procedure names. The commands just added are in
boldface:

: OVERWRITE KEY# POSITION C! &poorbfKEY# EMIT FORWARD ; : &poorbfRETYPE
( type from current position to &poorbfend of field and reset cursor) ;
: INSERT SLIDE> &poorbfRETYPE OVERWRITE ; : DELETE SLIDE< BLANK-END
&poorbfRETYPE ;

Since these are the only three functions that change memory, they are
the only three functions that need to refresh the screen. This idea is
critical. We must be able to make such assertions to assure program
correctness. The assertion is intrinsic to the nature of the problem.

Note that the additional problem of video refresh adds an additional
“pointer”: the current cursor position on the screen. But decomposition
by component has encouraged us to view the process as changing both the
data field and the video vision of it; similarly with and . For this
reason it seems natural now to maintain only one real pointer—a relative
one—from which we can compute either the data address in memory, or the
column number on the screen.

Since the nature of the pointer is wholly hidden within the three
processes , , and , we can readily accommodate this approach, even if it
wasn’t our first approach.

This change may have seemed simple enough here—even obvious. If so, it’s
because the technique ensures flexible design. If we had used a
traditional approach—if we had designed according to structure, or
according to data transformation through sequential processes—our
brittle design would have been shattered by the change.

To prove this assertion, we’ll have to start all over again from
scratch.
