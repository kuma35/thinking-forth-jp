Data Structures
===============

Still another defining word is , which is used like this:

17 CONSTANT SEVENTEEN

The new word can now be used in place of the actual number 17.

The defining word creates a location for temporary data. is used like
this:

VARIABLE BANANAS

This reserves a location which is identified by the name .

Fetching the contents of this location is the job of the word
(pronounced “fetch”). For instance,

BANANAS @

fetches the contents of the variable . Its counterpart is (pronounced
“store”), which stores a value into the location, as in:

100 BANANAS !

Forth also provides a word to increment the current value by the given
value; for instance, the phrase

2 BANANAS +!

increments the count by two, making it 102.

Forth provides many other data structure operators, but more
importantly, it provides the tools necessary for the programmer to
create any type of data structure needed for the application.
