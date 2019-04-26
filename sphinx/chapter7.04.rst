Local and Global Variables/Initialization
=========================================

As we saw earlier, a variable that is used exclusively within a single
definition (or single lexicon), hidden from other code, is called a
local variable. A variable used by more than one lexicon is called a
global variable. As we’ve seen in an earlier chapter, a set of global
variables that collectively describe a common interface between several
lexicons is called an “interface lexicon.”

Forth makes no distinction between local and global variables. But Forth
programmers do.

:

We should be writing for the reader. If something is referred to only
locally, a temporary variable just for accumulating a sum in, we should
define it locally. It’s handier to define it in the block where it’s
used, where you can see its comment.

If it’s used globally, we should collect things according to their
logical function, and define them together on a separate screen. One per
line with a comment.

The question is, where do you initialize them? Some say on the same
line, immediately following its definition. But that messes up the
comments, and there isn’t room for any decent comment. And it scatters
the initialization all over the application.

I tend to do all my initialization in the load screen. After I’ve loaded
all my blocks, I initialize the things that have to be initialized. It
might also set up color lookup tables or execute some initialization
code.

If your program is destined to be target compiled, then it’s easy to
write a word at the point that encompasses all the initialization.

It can get much more elaborate. I’ve defined variables in ROM where the
variables were all off in an array in high memory, and the initial
values are in ROM, and I copy up the initial values at initialization
time. But usually you’re only initializing a few variables to anything
other than zero.
