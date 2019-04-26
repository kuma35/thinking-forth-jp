The Language of Performance
===========================

Although performance is not the main topic of this book, the newcomer to
Forth should be reassured that its advantages aren’t purely
philosophical. Overall, Forth outdoes all other high-level languages in
speed, capability and compactness.

Speed
-----

Although Forth is an interpretive language, it executes compiled code.
Therefore it runs about ten times faster than interpretive BASIC.

Forth is optimized for the execution of words by means of a technique
known as “threaded code” :raw-latex:`\cite{bell72}`,
:raw-latex:`\cite{dewar}`, :raw-latex:`\cite{kogge82}`. The penalty for
modularizing into very small pieces of code is relatively slight.

It does not run as fast as assembler code because the inner interpreter
(which interprets the list of addresses that comprise each colon
definition) may consume up to 50% of the run time of primitive words,
depending on the processor.

But in large applications, Forth comes very close to the speed of
assembler. Here are three reasons:

First and foremost, Forth is simple. Forth’s use of a data stack greatly
reduces the performance cost of passing arguments from word to word. In
most languages, passing arguments between modules is one of the main
reasons that the use of subroutines inhibits performance.

Second, Forth allows you to define words either in high-level or in
machine language. Either way, no special calling sequence is needed. You
can write a new definition in high level and, having verified that it is
correct, rewrite it in assembler without changing any of the code that
uses it. In a typical application, perhaps 20% of the code will be
running 80% of the time. Only the most often used, time-critical
routines need to be machine coded. The Forth system itself is largely
implemented in machine-code definitions, so you’ll have few application
words that need to be coded in assembler.

.. figure:: img1-033.png
   :alt: The best top-down designs of mice and young men.
   
   The best top-down designs of mice and young men.

Third, Forth applications tend to be better designed than those written
entirely in assembler. Forth programmers take advantage of the
language’s prototyping capabilities and try out several algorithms
before settling on the one best suited for their needs. Because Forth
encourages change, it can also be called the language of optimization.

Forth doesn’t guarantee fast applications. It does give the programmer a
creative environment in which to design fast applications.

Capability
----------

Forth can do anything any other language can do—usually easier.

At the low end, nearly all Forth systems include assemblers. These
support control-structure operators for writing conditionals and loops
using structured programming techniques. They usually allow you to write
interrupts—you can even write interrupt code in high level if desired.

Some Forth systems are multitasked, allowing you to add as many
foreground or background tasks as you want.

Forth can be written to run on top of any operating system such as
RT-11, CP/M, or MS-DOS—or, for those who prefer it, Forth can be written
as a self-sufficient operating system including its own terminal drivers
and disk drivers.

With a Forth cross-compiler or target compiler, you can use Forth to
recreate new Forth systems, for the same computer or for different
computers. Since Forth is written in Forth, you have the otherwise
unthinkable opportunity to rewrite the operating system according to the
needs of your application. Or you can transport streamlined versions of
applications over to embedded systems.

Size
----

There are two considerations here: the size of the root Forth system,
and the size of compiled Forth applications.

The Forth nucleus is very flexible. In an embedded application, the part
of Forth you need to run your application can fit in as little as 1K. In
a full development environment, a multitasked Forth system including
interpreter, compiler, assembler, editor, operating system, and all
other support utilities averages 16K. This leaves plenty of room for
applications. (And some Forths on the newer processors handle 32-bit
addressing, allowing unimaginably large programs.)

Similarly, Forth compiled applications tend to be very small—usually
smaller than equivalent assembly language programs. The reason, again,
is threaded code. Each reference to a previously defined word, no matter
how powerful, uses only two bytes.

One of the most exciting new territories for Forth is the production of
Forth chips such as the Rockwell R65F11 Forth-based microprocessor
:raw-latex:`\cite{dumse}`. The chip includes not only hardware features
but also the run-time portions of the Forth language and operating
system for dedicated applications. Only Forth’s architecture and
compactness make Forth-based micros possible.
