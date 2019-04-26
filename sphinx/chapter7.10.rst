Using DOER/MAKE
===============

There are many occasions when the / construct proves beneficial. They
are:

#. To change the state of a function (when external testing of the state
   is not necessary). The words and change the state of the word .

#. To factor out internal phrases from similar definitions, but within
   control structures such as loops.

   Consider the definition of a word called , designed to reveal the
   contents of a specified region of memory.

   : DUMP ( a # ) O DO I 16 MOD O= IF CR DUP I + 5 U.R 2 SPACES THEN DUP
   I + &poorbf@ 6 U.R 2 +LOOP DROP ;

   The problem arises when you write a definition called , designed to
   format the output according to bytes, not cells:

   : CDUMP ( a # ) O DO I 16 MOD O= IF CR DUP I + 5 U.R 2 SPACES THEN
   DUP I + &poorbfC@ 4 U.R LOOP DROP ;

   The code within these two definitions is identical except for the
   fragments in boldface. But factoring is difficult because the
   fragments occur inside the .

   Here’s a solution to this problem, using /. The code that changes has
   been replaced with the word , whose behavior is vectored by the code
   in and . (Recognize that “” has the same effect as “”.)

   DOER .UNIT ( a – increment)  display byte or cell : <DUMP> ( a # ) O
   DO I 16 MOD O= IF CR DUP I + 5 U.R 2 SPACES THEN DUP I + &poorbf.UNIT
   +LOOP DROP ; : DUMP ( a #) MAKE .UNIT @ 6 U.R 2 ;AND <DUMP> ; : CDUMP
   ( a #) MAKE .UNIT C@ 4 U.R 1 ;AND <DUMP> ;

   Notice how and *set-up* the vector, then go on to *execute* the shell
   (the word ).

#. To change the state of related functions by invoking a single
   command. For instance:

   DOER TYPE’ DOER EMIT’ DOER SPACES’ DOER CR’ : VISIBLE MAKE TYPE’ TYPE
   ;AND MAKE EMIT’ EMIT ;AND MAKE SPACES’ SPACES ;AND MAKE CR’ CR ; :
   INVISIBLE MAKE TYPE’ 2DROP ;AND MAKE EMIT’ DROP ;AND MAKE SPACES’
   DROP ;AND MAKE CR’ ;

   Here we’ve defined a vectorable set of output words, each name having
   a “prime” mark at the end. sets them to their expected functions.
   makes them no-ops, eating up the arguments that would normally be
   passed to them. Say and any words defined in terms of these four
   output operators will *not* produce any output.

#. To change the state for the next occurrence only, then change the
   state (or reset it) again.

   Suppose we’re writing an adventure game. When the player first
   arrives at a particular room, the game will display a detailed
   description. If the player returns to the same room later, the game
   will show a shorter message.

   We write:

   DOER ANNOUNCE : LONG MAKE ANNOUNCE CR .“ You’re in a large hall with
   a huge throne” CR .“ covered with a red velvet canopy.” MAKE ANNOUNCE
   CR .“ You’re in the throne room.” ;

   The word will display either message. First we say , to initialize to
   the long message. Now we can test , and find that it prints the long
   message. Having done that, however, it continues to “make” display
   the short message.

   If we test a second time, it prints the short message. And it will
   for ever more, until we say again.

   In effect we’re queuing behaviors. We can queue any number of
   behaviors, letting each one set the next. The following example
   (though not terribly practical) illustrates the point.

   DOER WHERE VARIABLE SHIRT VARIABLE PANTS VARIABLE DRESSER VARIABLE
   CAR

   : ORDER   specify search order MAKE WHERE SHIRT MAKE WHERE PANTS MAKE
   WHERE DRESSER MAKE WHERE CAR MAKE WHERE O ;

   : HUNT ( – a\|O )   find location containing 17 ORDER 5 O DO WHERE
   DUP O= OVER @ 17 = OR IF LEAVE ELSE DROP THEN LOOP ;

   In this code we’ve created a list of variables, then defined an in
   which they are to be searched. The word looks through each of them,
   looking for the first one that contains a 17. returns either the
   address of the correct variable, or a zero if none have the value.

   It does this by simply executing five times. Each time, returns a
   different address, as defined in , then finally zero.

   We can even define a word that toggles its own behavior endlessly:

   DOER SPEECH : ALTERNATE BEGIN MAKE SPEECH .“ HELLO ” MAKE SPEECH .“
   GOODBYE ” O UNTIL ;

#. To implement a forward reference. A forward reference is usually
   needed as a “hook,” that is, a word invoked in a low-level definition
   but reserved for use by a component defined later in the listing.

   To implement a forward reference, build the header of the word with ,
   before invoking its name.

   DOER STILL-UNDEFINED

   Later in the listing, use ;

   MAKE STILL-UNDEFINED ALL THAT JAZZ ;

   (Remember, can be used outside a colon definition.)

#. Recursion, direct or indirect.

   Direct recursion occurs when a word invokes itself. A good example is
   the recursive definition of greatest-common-denominator:

   GCD of a, b = a if b = O GCD of b, a mod b if b > O

   This translates nicely into:

   DOER GCD ( a b – gcd) MAKE GCD ?DUP IF DUP ROT ROT MOD GCD THEN ;

   Indirect recursion occurs when one word invokes a second word, while
   the second word invokes the first. This can be done using the form:

   DOER B : A ... B ... ; MAKE B ... A ... ;

#. Debugging. I often define:

   DOER SNAP

   (short for ), then edit into my application at a point where I want
   to see what’s going on. For instance, with invoked inside the main
   loop of a keystroke interpreter, I can set it up to let me watch
   what’s happening to a data structure as I enter keys. And I can
   change what does without having to recompile the loop.

The situations in which it’s preferable to use the tick-and-execute
approach are those in which you need control over the address of the
vector, such as when vectoring through an element in a decision table,
or attempting to save/restore the contents of the vector.
