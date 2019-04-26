Compile-Time Factoring
======================

In the last section we looked at many techniques for organizing code and
data to reduce redundancy.

We can also apply limited redundancy during compilation, by letting
Forth do some of out dirty work.

For maximum maintainability, limit redundancy even at compile time.

Suppose in our application we must draw nine boxes as shown in .

    ********     ********     ********
    ********     ********     ********
    ********     ********     ********
    ********     ********     ********
    ********     ********     ********


    ********     ********     ********
    ********     ********     ********
    ********     ********     ********
    ********     ********     ********
    ********     ********     ********


    ********     ********     ********
    ********     ********     ********
    ********     ********     ********
    ********     ********     ********
    ********     ********     ********

In our design we need to have constants that represent values such as
the size of each box, the size of the gap between boxes, and the
left-most and top-most coordinates of the first box.

Naturally we can define:

8 CONSTANT WIDE 5 CONSTANT HIGH 4 CONSTANT AVE 2 CONSTANT STREET

(Streets run east and west; avenues run north and south.)

Now, to define the left margin, we might compute it mentally, We want to
center all these boxes on a screen 80 columns wide. To center something,
we subtract its width from 80 and divide by two to determine the left
margin. To figure the total width of all the boxes, we add

.. math::

   \begin{aligned}
   8 + 4 + 8 + 4 + 8 = 32\nonumber\end{aligned}

 (three widths and two avenues). :math:`(80-31) / 2 = 24`.

So we could, crudely, define:

24 CONSTANT LEFTMARGIN

and use the same approach for .

But what if we should later redesign the pattern, so that the width
changed, or perhaps the gap between the boxes? We’d have to recompute
the left margin ourselves.

In the Forth environment, we can use the full power of Forth even when
we’re compiling. Why not let Forth do the figuring?

WIDE 3 \* AVE 2 \* + 80 SWAP - 2/ CONSTANT LEFTMARGIN HIGH 3 \* STREET 2
\* + 24 SWAP - 2/ CONSTANT TOPMARGIN

If a constant’s value depends on the value of an earlier constant, use
Forth to calculate the value of the second.

None of these computations are performed when the application is
running, so run-time speed is not affected.

Here’s another example. shows the code for a word that draws shapes. The
word emits a star at every x–y coordinate listed in the table called .
(Note: the word positions the cursor to the ( x y ) coordinate on the
stack.)

Notice the line immediately following the list of points:

HERE POINTS - ( /table) 2/ CONSTANT #POINTS

    : P  ( x y -- )  C, C, ;
    CREATE POINTS
       10 10 P     10 11 P     10 12 P     10 13 P     10 14 P
       11 10 P     12 10 P     13 10 P     14 10 P
       11 12 P     12 12 P     13 12 P     14 12 P
    HERE POINTS -  ( /table)  2/  CONSTANT #POINTS
    : @POINTS  ( i -- x y)  2* POINTS + DUP 1+ C@  SWAP C@ ;
    : DRAW  #POINTS 0 DO  I @POINTS  XY  ASCII * EMIT  LOOP ;

The phrase “” computes the number of x–y coordinates in the table: this
value becomes the constant , used as the limit in ’s .

This construct lets you add or subtract points from the table without
worrying about the number of points there are. Forth computes this for
you.

Compile-Time Factoring through Defining Words
---------------------------------------------

Let’s examine a series of approaches to the same problem—defining a
group of related addresses. Here’s the first try:

HEX 01A0 CONSTANT BASE.PORT.ADDRESS BASE.PORT.ADDRESS CONSTANT SPEAKER
BASE.PORT.ADDRESS 2+ CONSTANT FLIPPER-A BASE.PORT.ADDRESS 4 + CONSTANT
FLIPPER-B BASE.PORT.ADDRESS 6 + CONSTANT WIN-LIGHT DECIMAL

The idea is right, but the implementation is ugly. The only elements
that change from port to port are the numeric offset and the name of the
port being defined; everything else repeats. This repetition suggests
the use of a defining word.

The following approach, which is more readable, combines all the
repeated code into the “does” part of a defining word:

: PORT ( offset – ) CREATE ,  does> ( – ’port) @ BASE.PORT.ADDRESS + ; 0
PORT SPEAKER 2 PORT FLIPPER-A 4 PORT FLIPPER-B 6 PORT WIN-LIGHT

In this solution we’re performing the offset calculation at *run*-time,
every time we invoke one of these names. It would be more efficient to
perform the calculation at compile time, like this:

: PORT ( offset – ) BASE.PORT.ADDRESS + CONSTANT ;  does> ( – ’port) 0
PORT SPEAKER 2 PORT FLIPPER-A 4 PORT FLIPPER-B 6 PORT WIN-LIGHT

Here we’ve created a defining word, , that has a unique *compile*-time
behavior, namely adding the offset to and defining a .

We might even go one step further. Suppose that all port addresses are
two bytes apart. In this case there’s no reason we should have to
specify these offsets. The numeric sequence

    0 2 4 6

is itself redundant.

In the following version, we begin with the on the stack. The defining
word duplicates this address, makes a constant out of it, then adds 2 to
the address still on the stack, for the next invocation of .

: PORT ( ’port – ’next-port) DUP CREATE , 2+ ;  does> ( – ’port)
BASE.PORT.ADDRESS PORT SPEAKER PORT FLIPPER-A PORT FLIPPER-B PORT
WIN-LIGHT DROP ( port.address)

Notice we must supply the initial port address on the stack before
defining the first port, then invoke when we’ve finished defining all
the ports to get rid of the port address that’s still on the stack.

One final comment. The base-port address is very likely to change, and
therefore should be defined in only one place. This does *not* mean it
has to be defined as a constant. Provided that the base-port address
won’t be used outside of this lexicon of port names, it’s just as well
to refer to it by number here.

HEX 01A0 ( base port adr) PORT SPEAKER PORT FLIPPER-A PORT FLIPPER-B
PORT WIN-LIGHT DROP
