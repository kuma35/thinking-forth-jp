Decomposition by Component
==========================

Has this sort of thing ever happened to you? You’ve been planning for
three months to take a weekend vacation to the mountains. You’ve been
making lists of what to bring, and daydreaming about the slopes.

Meanwhile you’re deciding what to wear to your cousin’s wedding next
Saturday. They’re informal types, and you don’t want to overdress.
Still, a wedding’s a wedding. Maybe you should rent a tuxedo anyway.

For all this planning, it’s not until Thursday that you realize the two
events coincide. You have expletives for such moments.

How is such a mental lapse possible, in one so intelligent as yourself?
Apparently the human mind actually makes links between memories. New
ideas are somehow added onto existing paths of related thoughts.

.. figure:: fig3-1.png
   :alt: Pools of thought not yet linked
   
   Pools of thought not yet linked

In the mishap just described, no connection was ever made between the
two separately-linked pools of thought until Thursday. The conflict
probably occurred when some new input (something as trivial as hearing
Saturday’s weather report) got linked into both pools of thought. A
lightning flash of realization arced between the pools, followed
inexorably by thunderous panic.

A simple tool has been invented to avoid such disasters. It’s called a
calendar. If you had recorded both plans in the same calendar, you would
have seen the other event scheduled, something your brain failed to do
for all its intricate magnificence.

To see the relationship between two things, put them close together. To
remind yourself of the relationship, *keep* them together.

These truisms apply to software design, particularly to the preliminary
design phase. This phase is traditionally the one in which the designer
dissects a large application into smaller, programmer-sized modules.

In we discovered that applications can be conveniently decomposed into
components.

The goal of preliminary design is to determine what components are
necessary to accomplish the requirements.

For instance, you might have an application in which events must occur
according to some predetermined schedule. To manage the scheduling, you
might first design a few words to constitute a “schedule-building
lexicon.” With these words you’ll be able to describe the order of
events that must occur within your application.

Thus within a single component, you’ll not only share information, but
also work out potential conflicts. The wrong approach would be to let
each functional module “know” things about its schedule that could
potentially conflict with another module’s schedule.

How can you know, in designing a component, what commands the using
components will need? Admittedly, this is something of a “chicken vs.
egg” problem. But Forth programmers handle it the same way chickens and
eggs do: iteratively.

If the component is well-designed, completeness doesn’t matter. In fact,
a component need only suffice for the current iteration’s design. No
component should be considered a “closed book” until the application has
been completed—which, in the case of maintained applications, is never.

As an example, imagine that your product needs to “talk” to other
machines in the outside world via a universal I/O chip that is part of
your system. This particular chip has a “control register” and a “data
register.” In a badly designed application, pieces of code throughout
the program would access the communication chip by simply invoking the
instruction to put an appropriate command byte into the command
register. This makes the entire application needlessly dependent on that
particular chip—very risky.

Instead, Forth programmers would write a component to control the I/O
chip. These commands would have logical names and a convenient interface
(usually Forth’s stack) to allow usage by the rest of the application.

For any iteration of your product’s design, you would implement only the
commands needed so far—not all the valid codes that could be sent to the
“control register.” If later in the project cycle you realize that you
need an additional command, say one to change the baud rate, the new
command would be added to the I/O chip lexicon, not to the code needed
to set the baud rate. There’s no penalty for making this change except
the few minutes (at most) it takes to edit and recompile.

Within each component, implement only the commands needed for the
current iteration. (But don’t preclude future additions.)

What goes on inside a component is pretty much its own business. It’s
not necessarily bad style for definitions within the component to share
redundant information.

For instance, a record in a certain data structure is fourteen bytes
long. One definition in the component advances a pointer 14 bytes to
point to the next record; another definition decrements the pointer 14
bytes.

As long as that number 14 remains a “secret” to the component and won’t
be used elsewhere, you don’t need to define it as constant. Just use the
number 14 in both definitions:

: +RECORD 14 RECORD# +! ; : -RECORD -14 RECORD# +! ;

On the other hand, if the value will be needed outside of the component,
or if it’s used several times within the component and there’s a good
chance that it will change, you’re better off hiding it behind a name:

14 CONSTANT /RECORD : +RECORD /RECORD RECORD# +! ; : -RECORD /RECORD
NEGATE RECORD# +! ;

(The name , by convention, means “bytes per record.”)
