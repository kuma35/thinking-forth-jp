Naming Standards: The Science
=============================

Learn and adopt Forth’s naming conventions.

In the quest for short, yet meaningful names, Forth programmers have
adopted certain naming conventions. includes a list of the most useful
conventions developed over the years.

An example of the power of naming conventions is the use of “dot” to
mean “print” or “display.” Forth itself uses

. D. U.R

for displaying various types of numbers in various formats. The
convention extends to application words as well. If you have a variable
called and you want a word that displays the date, use the name

.DATE

A caution: The overuse of prefixes and suffixes makes words uglier and
ultimately less readable. Don’t try to describe everything a word does
by its name alone. After all, a name is a symbol, not a shorthand for
code. Which is more readable and natural sounding?:

Oedipus complex

(which bears no intrinsic meaning), or

subconscious-attachment-to-parent-of-opposite-sex complex

Probably the former, even though it assumes you know the play.

Use prefixes and suffices to differentiate between like words rather
than to cram details of meaning into the name itself.

For instance, the phrase

... DONE IF CLOSE THEN ...

is just as readable as

... DONE? IF CLOSE THEN ...

and cleaner as well. It is therefore preferable, unless we need an
additional word called (as a flag, for instance).

A final tip on naming:

Begin all hex numbers with “0” (zero) to avoid potential collisions with
names.

For example, write , not .

By the way, don’t expect your Forth system to necessarily conform to the
above conventions. The conventions are meant to be used in new
applications.

Forth was created and refined over many years by people who used it as a
means to an end. At that time, it was neither reasonable nor possible to
impose naming standards on a tool that was still growing and evolving.

Had Forth been designed by committee, we would not love it so.
