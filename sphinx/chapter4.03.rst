Detailed Design
===============

We’re now at the point in the development cycle at which we’ve decided
we need a component (or a particular word). The component will consist
of a number of words, some of which (those that comprise the lexicon)
will be used by other components and some of which (the internal words)
will be only used within this component.

Create as many words as necessary to obey the following tip:

Each definition should perform a simple, well-defined task.

Here are the steps generally involved in designing a component:

#. Based on the required functions, decide on the names and syntax for
   the external definitions (define the interfaces).

#. Refine the conceptual model by describing the algorithm(s) and data
   structure(s).

#. Recognize auxiliary definitions.

#. Determine what auxiliary definitions and techniques are already
   available.

#. Describe the algorithm with pseudocode.

#. Implement it by working backwards from existing definitions to the
   inputs.

#. Implement any missing auxiliary definitions.

#. If the lexicon contains many names with strong elements in common,
   design and code the commonalities as internal definitions, then
   implement the external definitions.

We’ll discuss the first two steps in depth. Then we’ll engage in an
extended example of designing a lexicon.
