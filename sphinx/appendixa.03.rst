The Stack
=========

In Forth, variables and arrays are used for saving values that may be
required by many other routines and/or at unpredictable times. They are
*not* used for the local passing of data between the definitions. For
this, Forth employs a much simpler mechanism: the data stack.

When you type a number, it goes on the stack. When you invoke a word
which has numeric input, it will take it from the stack. Thus the phrase

17 SPACES

will display seventeen blanks on the current output device. “17” pushes
the binary value 17 onto the stack; the word consumes it.

A constant also pushes its value onto the stack; thus the phrase:

SEVENTEEN SPACES

has the same effect.

The stack operates on a “last-in, first-out” (LIFO) basis. This means
that data can be passed between words in an orderly, modular way,
consistent with the nesting of colon definitions.

For instance, a definition called might invoke the phrase . This
temporary activity on the stack will be transparent to any other
definition that invokes because the value placed on the stack is removed
before the definition of ends. The calling definition might have placed
some numbers of its own on the stack prior to calling . These will
remain on the stack, unharmed, until has been executed and the calling
definition continues.
