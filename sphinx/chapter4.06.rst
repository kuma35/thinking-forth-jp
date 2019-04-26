Calculations vs. Data Structures vs. Logic
==========================================

We’ve stated before that the best solution to a problem is the simplest
adequate one; for any problem we should strive for the simplest
approach.

Suppose we must write code to fulfill this specification:

if the input argument is 1, the output is 10 if the input argument is 2,
the output is 12 if the input argument is 3, the output is 14

There are three approaches we could take:

Calculation
     

    ( n) 1- 2\* 10 +

Data Structure
     

    CREATE TABLE 10 C, 12 C, 14 C, ( n) 1- TABLE + C@

Logic
     

    ( n) CASE 1 OF 10 ENDOF 2 OF 12 ENDOF 3 OF 14 ENDOF ENDCASE

In this problem, calculation is simplest. Assuming it is also adequate
(speed is not critical), calculation is best.

The problem of converting angles to sines and cosines can be implemented
more simply (at least in terms of lines of code and object size) by
calculating the answers than by using a data structure. But for many
applications requiring trig, it’s faster to look up the answer in a
table stored in memory. In this case, the simplest *adequate* solution
is using the data structure.

In we introduced the telephone rate problem. In that problem the rates
appeared to be arbitrary, so we designed a data structure:

+---------------+---------------+----------------+-----------------+
|               | *Full Rate*   | *Lower Rate*   | *Lowest Rate*   |
+===============+===============+================+=================+
| First Min.    | .30           | .22            | .12             |
+---------------+---------------+----------------+-----------------+
| Add’1 Mins.   | .12           | .10            | .06             |
+---------------+---------------+----------------+-----------------+

Using a data structure was simpler than trying to invent a formula by
which these values could be calculated. And the formula might prove
wrong later. In this case, table-driven code is easier to maintain.

In we designed a keystroke interpreter for our Tiny Editor using a
decision table:

+-----------------+-------------------+------------------+
| *Key*           | *Not-Inserting*   | *Inserting*      |
+-----------------+-------------------+------------------+
| ``Ctrl-D``      | ``DELETE``        | ``INSERT-OFF``   |
+-----------------+-------------------+------------------+
| ``Ctrl-I``      | ``INSERT-ON``     | ``INSERT-OFF``   |
+-----------------+-------------------+------------------+
| ``backspace``   | ``BACKWARD``      | ``INSERT<``      |
+-----------------+-------------------+------------------+
| etc.            |                   |                  |
+-----------------+-------------------+------------------+

We could have achieved this same result with logic:

CASE CTRL-D OF ’INSERTING @ IF INSERT-OFF ELSE DELETE THEN ENDOF CTRL-I
OF ’INSERTING @ IF INSERT-OFF ELSE INSERT-ON THEN ENDOF BACKSPACE OF
’INSERTING @ IF INSERT< ELSE BACKWARD THEN ENDOF ENDCASE

but the logic is more confusing. And the use of logic to express such a
multi-condition algorithm gets even more convoluted when a table was not
used in the original design.

The use of logic becomes advisable when the result is not calculable, or
when the decision is not complicated enough to warrant a decision table.
is devoted to the issue of minimizing the use of logic in your programs.

In choosing which approach to apply towards solving a problem, give
preference in the following order:

#. calculation (except when speed counts)

#. data structures

#. logic

Of course, one nice feature of modular languages such as Forth is that
the actual implementation of a component—whether it uses calculation,
data structures, or logic—doesn’t have to be visible to the rest of the
application.
