Component Programming
=====================

Having a larger set of simpler words makes it easy to use a technique
we’ll call “component programming.” To explain, let’s first reexamine
these collections we have vaguely described as “things that may change.”
In a typical system, just about everything is subject to change: I/O
devices such as terminals and printers, interfaces such as UART chips,
the operating system, any data structure or data representation, any
algorithm, etc.

The question is: “How can we minimize the impact of any such change?
What is the smallest set of other things that must change along with
such a change?”

The answer is: “The smallest set of interacting data structures and
algorithms that share knowledge about how they collectively work.” We’ll
call this unit a “component.”

A component is a resource. It may be a piece of hardware such as a UART
or a hardware stack. Or the component may be a software resource such as
a queue, a dictionary, or a software stack.

All components involve data objects and algorithms. It doesn’t matter
whether the data object is physical (such as a hardware register), or
abstract (such as a stack location or a field in a data base). It
doesn’t matter whether the algorithm is described in machine code or in
problem-oriented words such as and .

.. figure:: fig1-7.png
   :alt: Structured design vs. component design.
   
   Structured design vs. component design.

contrasts the results of structured design with the results of designing
by components. Instead of *modules* called , , and , we’re concerned
with *components* that describe the structure of records, provide a set
of editor commands, and provide read/write routines to storage.

What have we done? We’ve inserted a new stage in the development
process: We decomposed by components in our *design*, then we described
the sequence, hierarchy, and input-process-output in our
*implementation*. Yes, it’s an extra step, but we now have an extra
dimension for decomposition—not just slicing but *dicing*.

Suppose that, after the program is written, we need to change the record
structure. In the sequential, hierarchical design, this change would
affect all three modules. In the design by components, the change would
be confined to the record-structure component. No code that uses this
component needs to know of the change.

Aside from maintenance, an advantage to this scheme is that programmers
on a team can be assigned components individually, with less
interdependence. The principle of component programming applies to team
management as well as to software design. We’ll call the set of words
which describe a component a “lexicon.” (One meaning of lexicon is “a
set of words pertaining to a particular field of interest.”) The lexicon
is your interface with the component from the outside ().

In this book, the term “lexicon” refers only to those words of a
component that are used by name outside of a component. A component may
also contain definitions written solely to support the externally
visible lexicon. We’ll call the supporting definitions “internal” words.

.. figure:: fig1-8.png
   :alt: A lexicon describes a component.
   
   A lexicon describes a component.

The lexicon provides the logical equivalents to the data objects and
algorithms in the form of names. The lexicon veils the component’s data
structures and algorithms—the “how it works.” It presents to the world
only a “conceptual model” of the component described in simple words—the
“what it does.”

These words then become the language for describing the data structures
and algorithms of components written at a a higher level. The “what” of
one component becomes the “how” of a higher component.

.. figure:: fig1-9.png
   :alt: The entire application consists of components.
   
   The entire application consists of components.

Written in Forth, an entire application consists of nothing but
components. show show a robotics application might be decomposed.

You could even say that each lexicon is a special-purpose compiler,
written solely for the purpose of supporting higher-level application
code in the most efficient and reliable way.

By the way, Forth itself doesn’t support components. It doesn’t need to.
Components are the product of the program designer’s decomposition.
(Forth does have “screens,” however—small units of mass storage for
saving source code. A component can usually be written in one or two
screens of Forth.)

It’s important to understand that a lexicon can be used by any and all
of the components at higher levels. Each successive component does *not*
bury its supporting components, as is often the case with layered
approaches to design. Instead, each lexicon is free to use all of the
commands beneath it. The robot-movement command relies on the root
language, with its variables, constants, stack operators, math
operators, and so on, as heavily as any other component.

An important result of this approach is that the entire application
employs a single syntax, which makes it easy to learn and maintain. This
is why I use the term “lexicon” and not “language.” Languages have
unique syntaxes.

This availability of commands also makes the process of testing and
debugging a whole lot easier. Because Forth is interactive, the
programmer can type and test the primitive commands, such as

RIGHT SHOULDER 20 PIVOT

from the “outside” as easily as the more powerful ones like

LIFT COFFEE-POT

At the same time, the programmer can (if he or she wants) deliberately
seal any commands, including Forth itself, from being accessed by the
end user, once the application is complete.

Now Forth’s methodology becomes clear. Forth programming consists of
extending the root language toward the application, providing new
commands that can be used to describe the problem at hand.

Programming languages designed especially for particular applications
such as robotics, inventory control, statistics, etc., are known as
“application-oriented languages.” Forth is a programming environment for
*creating* application-oriented languages. (That last sentence may be
the most succinct description of Forth that you’ll find.)

In fact, you shouldn’t write any serious application in Forth; as a
language it’s simply not powerful enough. What you *should* do is write
your own language in Forth (lexicons) to model your understanding of the
problem, in which you can elegantly describe its solution.
