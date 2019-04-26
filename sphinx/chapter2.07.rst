Defining the Rules
==================

Most of your efforts at defining a problem will center on describing the
interface. Some applications will also require that you define the set
of application rules.

All programming involves rules. Usually these rules are so simple it
hardly matters how you express them: “If someone pushes the button, ring
the bell.”

Some applications, however, involve rules so complicated that they can’t
be expressed in a few sentences of English. A few formal techniques can
come in handy to help you understand and document these more complicated
rules.

Here’s an example. Our requirements call for a system to compute the
charges on long-distance phone calls. Here’s the customer’s explanation
of its rate structure. (I made this up; I have no idea how the phone
company actually computes their rates except that they overcharge.)

All charges are computed by the minute, according to distance in
hundreds of miles, plus a flat charge. The flat charge for direct dial
calls during weekdays between 8 A.M. and 5 P.M. is .30 for the first
minute, and .20 for each additional minute; in addition, each minute is
charged .12 per 100 miles. The flat charge for direct calls during
weekdays between 5 P.M. and 11 P.M. is .22 for the first minute, and .15
for each additional minute; the distance rate per minute is .10 per 100
miles. The flat charge for direct calls late during weekdays between 11
P.M. or anytime on Saturday, Sundays, or holidays is .12 for the first
minute, and .09 for each additional minute; the distance rate per minute
is .06 per 100 miles. If the call requires assistance from the operator,
the flat charge increases by .90, regardless of the hour.

This description is written in plain old English, and it’s quite a
mouthful. It’s hard to follow and, like an attic cluttered with
accumulated belongings, it may even hide a few bugs.

In building a conceptual model for this system, we must describe the
rate structure in an unambiguous, useful way. The first step towards
cleaning up the clutter involves factoring out irrelevant pieces of
information—that is, applying the rules of limited redundancy. We can
improve this statement a lot by splitting it into two statements. First
there’s the time-of-day rule:

Calls during weekdays between 8 A.M. and 5 P.M. are charged at “full”
rate. Calls during weekdays between 5 P.M. and 11 P.M. are charged at
“lower” rate. Calls placed during weekdays between 11 P.M. or anytime on
Saturday, Sundays, or holidays are charged at the “lowest” rate.

Then there’s the rate structure itself, which should be described in
terms of “first-minute rate,” “additional minute rate,” “distance rate,”
and “operator-assistance rate.”

Factor the fruit. (Don’t confuse apples with oranges.)

These prose statements are still difficult to read, however. System
analysts use several techniques to simplify these statements: structured
English, decision trees, and decision tables. Let’s study each of these
techniques and evaluate their usefulness in the Forth environment.

Structured English
------------------

Structured English is a sort of structured pseudocode in which our rate
statement would read something like this:

IF full rate IF direct-dial IF first-minute .30 + .12/100miles ELSE (
add’l- minute) .20 + .12/100miles ENDIF ELSE ( operator ) IF
first-minute 1.20 + .12/100miles ELSE ( add’l- minute) .20 +
.12/100miles ENDIF ENDIF ELSE ( not-full-rate) IF lower-rate IF
direct-dial IF first-minute .22 + .10/100miles ELSE ( add’l- minute) .15
+ .10/100miles END IF ELSE ( operator) IF first-minute 1.12 +
.10/100miles ELSE ( add’l- minute) .15 + .10/100miles ENDIF ENDIF ELSE (
lowest-rate) IF direct-dial IF first-minute .12 + .06/100miles ELSE (
add’l- minute) .09 + .O6/100miles ENDIF ELSE ( operator) IF first-minute
1.02 + .O6/100miles ELSE ( add’l- minute) .09 + .06/100miles ENDIF ENDIF
ENDIF ENDIF

This is just plain awkward. It’s hard to read, harder to maintain, and
hardest to write. And for all that, it’s worthless at implementation
time. I don’t even want to talk about it anymore.

The Decision Tree
-----------------

.. figure:: fig2-4.png
   :alt: Example of a decision tree.
   
   Example of a decision tree.

illustrates the telephone rate rules by means of a decision tree. The
decision tree is the easiest method of any to “follow down” to determine
the result of certain conditions. For this reason, it may be the best
representation to show the customer.

Unfortunately, the decision tree is difficult to “follow up,” to
determine which conditions produce certain results. This difficulty
inhibits seeing ways to simplify the problem. The tree obscures the fact
that additional minutes cost the same, whether the operator assists or
not. You can’t see the facts for the tree.

The Decision Table
------------------

The decision table, described next, provides the most usable graphic
representation of compound rules for the programmer, and possibly for
the customer as well. shows our rate structure rules in decision-table
form.

.. figure:: fig2-5.png
   :alt: The decision table.
   
   The decision table.

In there are three dimensions: the rate discount, whether an operator
intervenes, and initial minute vs. additional minute.

Drawing problems with more than two dimensions gets a little tricky. As
you can see, these additional dimensions can be depicted on paper as
subdimensions within an outer dimension. All of the subdimension’s
conditions appear within every condition of the outer dimension. In
software, any number of dimensions can be easily handled, as we’ll see.

All the techniques we’ve described force you to analyze which conditions
apply to which dimensions. In factoring these dimensions, two rules
apply:

First, all the elements of each dimension must be mutually exclusive.
You don’t put “first minute” in the same dimension as “direct dial,”
because they are not mutually exclusive.

Second, all possibilities must be accounted for within each dimension.
If there were another rate for calls made between 2 A.M. to 2:05 A.M.,
the table would have to be enlarged.

But our decision tables have other advantages all to themselves. The
decision table not only reads well to the client but actually benefits
the implementor in several ways:

Transferability to actual code.
    This is particularly true in Forth, where decision tables are easy
    to implement in a form very similar to the drawing.

Ability to trace the logic upwards.
    Find a condition and see what factors produced it.

Clearer graphic representation.
    Decision tables serve as a better tool for understanding, both for
    the implementor and the analyst.

Unlike decision trees, these decision tables group the *results*
together in a graphically meaningful way. Visualization of ideas helps
in understanding problems, particularly those problems that are too
complex to perceive in a linear way.

For instance, clearly shows that the charge for additional minutes does
not depend on whether an operator assisted or not. With this new
understanding we can draw a simplified table, as shown in .

.. figure:: fig2-6.png
   :alt: A simplified decision table.
   
   A simplified decision table.

It’s easy to get so enamored of one’s analytic tools that one forgets
about the problem. The analyst must do more than carry out all
possibilities of a problem to the nth degree, as I have seen authors of
books on structured analysis recommend. That approach only increases the
amount of available detail. The problem solver must also try to simplify
the problem.

You don’t understand a problem until you can simplify it.

If the goal of analysis is not only understanding, but simplification,
then perhaps we’ve got more work to do.

Our revised decision table () shows that the per-mile charge depends
only on whether the rate is full, lower, or lowest. In other words, it’s
subject to only one of the three dimensions shown in the table. What
happens if we split this table into two tables, as in ?

.. figure:: fig2-7.png
   :alt: The sectional decision table.
   
   The sectional decision table.

Now we’re getting the answer through a combination of table look-up and
calculation. The formula for the per-minute charge can be expressed as a
pseudoForth definition:

: PER-MINUTE-CHARGE ( – per-minute-charge) CONNECT-CHARGE MILEAGE-CHARGE
+ ;

The “” now appears once in the definition, not nine times in the table.

Taking the principle of calculation one step further, we note (or
remember from the original problem statement) that operator assistance
merely adds a one-time charge of .90 to the total charge. In this sense,
the operator charge is not a function of any of the three dimensions.
It’s more appropriately expressed as a “logical calculation”; that is, a
function that combines logic with arithmetic:

: ?ASSISTANCE ( direct-dial-charge – total-charge) OPERATOR? IF .90 +
THEN ;

(But remember, this charge applies only to the first minute.)

.. figure:: fig2-8.png
   :alt: The decision table without operator involvement depicted.
   
   The decision table without operator involvement depicted.

This leaves us with the simplified table shown in , and an increased
reliance on expressing calculations. Now we’re getting somewhere.

Let’s go back to our definition of :

: PER-MINUTE-CHARGE ( – per-minute-charge) CONNECT-CHARGE MILEAGE-CHARGE
+ ;

Let’s get more specific about the rules for the connection charge and
for the mileage charge.

The connection charge depends on whether the minute is the first or an
additional minute. Since there are two kinds of per-minute charges,
perhaps it will be easiest to rewrite as two different words.

Let’s assume we will build a component that will fetch the appropriate
rates from the table. The word will get the rate for the first minute;
will get the rate for each additional minute. Both of these words will
depend on the time of day to determine whether to use the full, lower,
or lowest rates.

Now we can define the pair of words to replace :

: FIRST ( – charge) 1MINUTE ?ASSISTANCE MILEAGE-CHARGE + ; :
PER-ADDITIONAL ( – charge) +MINUTES MILEAGE-CHARGE + ;

What is the rule for the mileage charge? Very simple. It is the rate
(per hundred miles) times the number of miles (in hundreds). Let’s
assume we can define the word , which will fetch the mileage rate from
the table:

: MILEAGE-CHARGE ( – charge) #MILES @ MILEAGE-RATE \* ;

Finally, if we know the total number of minutes for a call, we can now
calculate the total direct-dial charge:

: TOTAL ( – total-charge) FIRST ( first minute rate) ( #minutes) 1- (
additional minutes) PER-ADDITIONAL \* ( times the rate) + ; ( added
together)

We’ve expressed the rules to this particular problem through a
combination of simple tables and logical calculations.

(Some final notes on this example: We’ve written something very close to
a running Forth application. But it is only pseudocode. We’ve avoided
stack manipulations by assuming that values will somehow be on the stack
where the comments indicate. Also, we’ve used hyphenated names because
they might be more readable for the customer. Short names are preferred
in real code—see .)

We’ll unveil the finished code for this example in .
