Listing Organization
====================

A well-organized book has clearly defined chapters, with clearly defined
sections, and a table of contents to help you see the organization at a
glance. A well-organized book is easy to read. A badly organized book
makes comprehension more difficult, and makes finding information later
on nearly impossible.

.. figure:: fig5-1.png
   :alt: I still don't see how these programming conventions
   enhance readability.
   

    enhance readability.

The necessity for good organization applies to an application listing as
well. Good organization has three aspects:

#. Decomposition

#. Composition

#. Disk partitioning

Decomposition
-------------

As we’ve already seen, the organization of a listing should follow the
decomposition of the application into lexicons. Generally these lexicons
should be sequenced in “uses” order. Lexicons being *used* should
precede the lexicons which *use* them.

On a larger scale, elements in a listing should be organized by degree
of complexity, with the most complex variations appearing towards the
end. It’s best to arrange things so that you can leave off the
lattermost screens (i.e., not load them) and still have a
self-sufficient, running application, working properly except for the
lack of the more advanced features.

We discussed the art of decomposition extensively in .

Composition
-----------

Composition is the putting together of pieces to create a whole. Good
composition requires as much artistry as good decomposition.

One of Forth’s present conventions is that source code resides in
“screens,” which are 1K units of mass storage. (The term “screen” refers
to a block used specifically for source code.) It’s possible in Forth to
chain every screen of code to the next, linking the entire listing
together linearly like a lengthy parchment scroll. This is not a useful
approach. Instead:

Structure your application listing like a book: hierarchically.

An application may consist of:

Screens:
    the smallest unit of Forth source

Lexicons:
    one to three screens, enough to implement a component

Chapters:
    a series of related lexicons, and

Load screens:
    analogous to a table of contents, a screen that loads the chapters
    in the proper sequence.

 QTF+ Load Screen 07/09/83 : RELEASE# .“ 2.01” ; 9 LOAD  compiler tools,
language primitives 12 LOAD  video primitives 21 LOAD  editor 39 LOAD
 line display 48 LOAD  formatter 69 LOAD  boxes 81 LOAD  deferring 90
LOAD  framing 96 LOAD  labels, figures, tables 102 LOAD  table of
contents generator

Application-load Screen
-----------------------

is an example of an application-load screen. Since it resides in Screen
1, you can load this entire application by entering

1 LOAD

The individual load commands within this screen load the chapters of the
application. For instance, Screen 12 is the load screen for the video
primitives chapter.

As a reference tool, the application-load screen tells you where to find
all of the chapters. For instance, if you want to look at the routines
that do framing, you can see that the section starts at Screen 90.

Each chapter-load screen in turn, loads all of the screens comprising
the chapter. We’ll study some formats for chapter-load screens shortly.

The primary benefit of this hierarchical scheme is that you can load any
section, or any screen by itself, without having to load the entire
application. Modularity of the source code is one of the reasons for
Forth’s quick turnaround time for editing, loading, and testing
(necessary for the iterative approach). Like pages of a book, each
screen can be accessed individually and quickly. It’s a “random access”
approach to source-code maintenance.

You can also replace any passage of code with a new, trial version by
simply changing the screen numbers in the load screen. You don’t have to
move large passages of source code around within a file.

In small applications, there may not be such things as chapters. The
application-load screen will directly load all the lexicons. In larger
applications, however, the extra level of hierarchy can improve
maintainability. A screen should either be a load-screen or a
code-screen, not a mixture. Avoid embedding a or command in the middle
of a screen containing definitions just because you “need something” or
because you “ran out of room.”

Skip Commands
-------------

Two commands make it easy to control what gets loaded in each screen and
what gets ignored. They are:

**
     

**
    also called

is pronounced “skip-line.” It causes the Forth interpreter to ignore
everything to the right of it on the same line. (Since is a Forth word,
it must be followed by a space.) It does not require a delimiter.

In , you see used in two ways: to begin the screen-comment line (Line
0), and to begin comments on individual lines which have no more code to
the right of the comment.

During testing, also serves to temporarily “paren out” lines that
already contain a right parenthesis in a name or comment. For instance,
these two “skip-line”s keep the definition of from being compiled
without causing problems in encountering either right parenthesis:

 : NUTATE ( x y z )   SWAP ROT (NUTATE) ;

is pronounced “skip-screen.” It causes the Forth interpreter to stop
interpreting the screen entirely, as though there were nothing else in
the screen beyond .

In many Forth systems, this function is the same as , which is the
run-time routine for semicolon. In these systems the use of is
acceptable. Some Forth systems, however, require for internal reasons a
different routine for the “skip-screen” function.

Definitions for and can be found in .

Chapter-load Screens
--------------------

illustrates a typical chapter-load screen. The screens loaded by this
screen are referred to relatively, not absolutely as they were in the
application-load screen.

This is because the chapter-load screen is the first screen of the
contiguous range of screens in the chapter. You can move an entire
chapter forward or backward within the listing; the relative pointers in
the chapter-load screen are position-independent. All you have to change
is the single number in the application-load screen that points to the
beginning of the chapter.

 GRAPHICS Chapter load 07/11/83

1 FH LOAD  dot-drawing primitive 2 FH 3 FH THRU  line-drawing primitives
4 FH 7 FH THRU  scaling, rotation 8 FH LOAD  box 9 FH 11 FH THRU  circle

CORNER  initialize relative position to low-left corner

Use absolute screen numbers in the application-load screen. Use relative
screen numbers in the chapter- or section-load screens.

There are two ways to implement relative loading. The most common is to
define:

: +LOAD ( offset – ) BLK @ + LOAD ;

and

: +THRU ( lo-offset hi-offset – ) 1+ SWAP DO I +LOAD LOOP ;

My own way, which I submit as a more useful factoring, requires a single
word, (see for its definition).

The phrase

1 FH LOAD

is read “1 from here ,” and is equivalent to .

Similarly,

2 FH 5 FH THRU

is read “2 from here, 5 from here .”

Some programmers begin each chapter with a dummy word; e.g.,

: VIDEO-IO ;

and list its name in the comment on the line where the chapter is loaded
in the application-load screen. This permits selectively ting any
chapter and reloading from that point on without having to look at the
chapter itself.

Within a chapter the first group of screens will usually define those
variables, constants, and other data structures needed globally within
the chapter. Following that will come the lexicons, loaded in “uses”
order. The final lines of the chapter-load screen normally invoke any
needed initialization commands.

Some of the more style-conscious Forthwrights begin each chapter with a
“preamble” that discusses in general terms the theory of operation for
the components described in the chapter. is a sample preamble screen
which demonstrates the format required at Moore Products Co.

CHAPTER 5 - ORIGIN/DESTINATION - MULTILOOP BIT ROUTINES

DOCUMENTS - CONSOLE STRUCTURE CONFIGURATION DESIGN SPECIFICATION
SECTIONS - 3.2.7.5.4.1.2.8 3.2.7.5.4.1.2.10

ABSTRACT - File control types E M T Q and R can all originate from a
Regional Satellite or a Data Survey Satellite. These routines allow the
operator to determine whether the control originated from a Regional
Satellite or not.

CHAPTER NOTES - Whether or not a point originates from a Regional
Satellite is determined by the Regional bit in BITS, as follows:

1 = Regional Satellite 2 = Data Survey Satellite

For the location of the Regional bit in BITS, see the Design
Specification Section - 3.2.7.5.4.1.2.10

HISTORY -

(no relation to Moore Products Co.) places less importance on the
well-organized hierarchical listing than I do. :

I structure *applications* hierarchically, but not necessarily
*listings.* My listings are organized in a fairly sloppy way, not at all
hierarchically in the sense of primitives first.

I use also known as ; see the Handy Hint in *Starting Forth,* Chapter
Nine]. As a result, the listing is much less carefully organized because
I have to find things for me. I never look at listings.

––> vs. THRU
------------

On the subject of relative loading, one popular way to load a series of
adjacent screens is with the word (pronounced “next block”). This word
causes the interpreter to immediately cease interpreting the current
screen and begin interpreting the next (higher-numbered) screen.

If your system provides , you must choose between using the command in
your chapter-load screen to load each series of screens, or linking each
series together with the arrows and ing only the first in the series.
(You can’t do both; you’d end up loading most of the screens more than
once.)

The nice thing about the arrows is this: suppose you change a screen in
the middle of a series, then reload the screen. The rest of the series
will automatically get loaded. You don’t have to know what the last
screen is.

That’s also the nasty thing about the arrows: There’s no way to stop the
loading process once it starts. You may compile a lot more screens than
you need to test this one screen.

To get analytical about it, there are three things you might want to do
after making the change just described:

#. load the one screen only, to test the change,

#. load the entire section in which the screen appears, or

#. load the entire remainder of the application.

The use of seems to give you the greatest control.

Some people consider the arrow to be useful for letting definitions
cross screen boundaries. In fact is the only way to compile a high-level
(colon) definition that occupies more than one screen, because is
“immediate.” But it’s *never* good style to let a colon definition cross
screen boundaries. (They should never be that long!)

On the other hand, an extremely complicated and time-critical piece of
assembler coding might occupy several sequential screens. In this case,
though, normal ing will do just as well, since the assembler does not
use compilation mode, and therefore does not require immediacy.

Finally, the arrow wastes an extra line of each source screen. We don’t
recommend it.

An Alternative to Screens: Source in Named Files
------------------------------------------------

Some Forth practitioners advocate storing source code in
variable-length, named text files, deliberately emulating the approach
used by traditional compilers and editors. This approach may become more
and more common, but its usefulness is still controversial.

Sure, it’s nice not to have to worry about running out of room in a
screen, but the hassle of writing in a restricted area is compensated
for by retaining control of discrete chunks of code. In developing an
application, you spend a lot more time loading and reloading screens
than you do rearranging their contents.

“Infinite-length” files allow sloppy, disorganized thinking and bad
factoring. Definitions become longer without the discipline imposed by
the 1K block boundaries. The tendency becomes to write a 20K file, or
worse: a 20K definition.

Perhaps a nice compromise would be a file-based system that allows
nested loading, and encourages the use of very small named files. Most
likely, though, the more experienced Forth programmers would not use
named files longer than 5K to 10K. So what’s the benefit?

Some might answer that rhetorical question: “It’s easier to remember
names than numbers.” If that’s so, then predefine those block numbers as
constants, e.g.:

90 CONSTANT FRAMING

Then to load the “framing” section, enter

FRAMING LOAD

Or, to list the section’s load block, enter

FRAMING LIST

(It’s a convention that names of sections end in “ING.”)

Of course, to minimize the hassle of the screen-based approach you need
good tools, including editor commands that move lines of source from one
screen to another, and words that slide a series of screens forward or
back within the listing.

Disk Partitioning
-----------------

The final aspect of the well-organized listing involves standardizing an
arrangement for what goes where on the disk. These standards must be set
by each shop, or department, or individual programmer, depending on the
nature of the work.

Screen 0
    is the title screen, showing the name of the application, the
    current release number, and primary author.

Screen 1
    is the application-load block.

Screen 2
    is reserved for possible continuation from Screen 1

Screen 4 and 5
    contain system messages.

Screens 9 thru 29
    incorporate general utilities needed in, but not restricted to, this
    application.

Screen 30
    begins the application screens.

shows a typical department’s partitioning scheme.

In many Forth shops it’s considered desirable to begin sections of code
on screen numbers that are evenly divisible by three. Major divisions on
a disk should be made on boundaries evenly divisible by thirty.

The reason? By convention, Forth screens are printed three to a page,
with the top screen always evenly divisible by three. Such a page is
called a “triad;” most Forth systems include the word to produce it,
given as an argument the number of any of the three screens in the
triad. For instance, if you type

77 TRIAD

you’ll get a page that includes 75, 76, and 77.

The main benefit of this convention is that if you change a single
screen, you can slip the new triad right into your binder containing the
current listing, replacing exactly one page with no overlapping screens.

Similarly, the word lists the first line of each screen, 60 per page, on
boundaries evenly divisible by 60.

Begin sections or lexicons on screen numbers evenly divisible by three.
Begin applications or chapters on screen numbers evenly divisible by
thirty.

Electives
---------

Vendors of Forth systems have a problem. If they want to include every
command that the customer might expect—words to control graphics,
printers, and other niceties—they often find that the system has swollen
to more than half the memory capacity of the computer, leaving less room
for serious programmers to compile their applications. The solution is
for the vendor to provide the bare bones as a precompiled nucleus, with
the extra goodies provided in *source* form. This approach allows the
programmer to pick and choose the special routines actually needed.

These user-loadable routines are called “electives.” Double-length
arithmetic, date and time support, statements and the / construct
(described later) are some of the features that Forth systems should
offer as electives.
