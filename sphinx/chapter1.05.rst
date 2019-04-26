Hide From Whom?
===============

Because modern mainstream languages give a slightly different meaning to
the phrase “information-hiding,” we should clarify. From what, or whom
are we hiding information?

The newest traditional languages (such as Modula 2) bend over backwards
to ensure that modules hide internal routines and data structures from
other modules. The goal is to achieve module independence (a minimum
coupling). The fear seems to be that modules strive to attack each other
like alien antibodies. Or else, that evil bands of marauding modules are
out to clobber the precious family data structures.

This is *not* what we’re concerned about. The purpose of hiding
information, as we mean it, is simply to minimize the effects of a
possible design-change by localizing things that might change within
each component.

Forth programmers generally prefer to keep the program under their own
control and not to employ any techniques to physically hide data
structures. (Nevertheless a brilliantly simple technique for adding
Modula-type modules to Forth has been implemented, in only three lines
of code, by :raw-latex:`\cite{shorre71}`.)
