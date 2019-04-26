Factoring
=========

In this chapter we’ll continue our study of the implementations phase,
this time focusing on factoring.

Decomposition and factoring are chips off the same block. Both involve
dividing and organizing. Decomposition occurs during preliminary design;
factoring occurs during detailed design and implementation.

Since every colon definition reflects decisions of factoring, an
understanding of good factoring technique is perhaps the most important
skill for a Forth programmer.

What is factoring? Factoring means organizing code into useful
fragments. To make a fragment useful, you often must separate reusable
parts from non-reusable parts. The reusable parts become new
definitions. The non-reusable parts become arguments or parameters to
the definitions.

Making this separation is usually referred to as “factoring out.” The
first part of this chapter will discuss various “factoring-out”
techniques.

Deciding how much should go into, or stay out of, a definition is
another aspect of factoring. The second section will outline the
criteria for useful factoring.
