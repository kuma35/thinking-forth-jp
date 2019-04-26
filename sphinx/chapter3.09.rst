For Further Thinking
====================

*(Answers appear in .)*

#. Below are two approaches to defining an editor’s keyboard
   interpreter. Which would you prefer? Why?

   #. ( Define editor keys ) HEX 72 CONSTANT UPCURSOR 80 CONSTANT
      DOWNCURSOR 77 CONSTANT RIGHTCURSOR 75 CONSTANT LEFTCURSOR 82
      CONSTANT INSERTKEY 83 CONSTANT DELETEKEY DECIMAL ( Keystroke
      interpreter) : EDITOR BEGIN MORE WHILE KEY CASE UPCURSOR OF
      CURSOR-UP ENDOF DOWNCURSOR OF CURSOR-DOWN ENDOF RIGHTCURSOR OF
      CURSOR> ENDOF LEFTCURSOR OF CURSOR< ENDOF INSERTKEY OF INSERTING
      ENDOF DELETEKEY OF DELETE ENDOF ENDCASE REPEAT ;

   #. ( Keystroke interpreter) : EDITOR BEGIN MORE WHILE KEY CASE 72 OF
      CURSOR-UP ENDOF 80 OF CURSOR-DOWN ENDOF 77 OF CURSOR> ENDOF 75 OF
      CURSOR< ENDOF 82 OF INSERTING ENDOF 83 OF DELETE ENDOF ENDCASE
      REPEAT ;

#. This problem is an exercise in information hiding. Let’s suppose we
   have a region of memory outside of the Forth dictionary which we want
   to allocate for data structures (for whatever reason). The region of
   memory begins at address . We want to define a series of arrays which
   will reside in that memory.

   We might do something like this:

   HEX C000 CONSTANT FIRST-ARRAY ( 8 bytes) C008 CONSTANT SECOND-ARRAY (
   6 bytes) C00C CONSTANT THIRD ARRAY ( 100 bytes)

   Each array-name defined above will return the starting address of the
   appropriate array. But notice we had to compute the correct starting
   address for each array, based on how many bytes we had already
   allocated. Let’s try to automate this, by keeping an “allocation
   pointer,” called , showing where the next free byte is. We first set
   the pointer to the beginning of the RAM space:

   VARIABLE >RAM C000 >RAM !

   Now we can define each array like this: x

   >RAM @ CONSTANT FIRST-ARRAY 8 >RAM +! >RAM @ CONSTANT SECOND-ARRAY 6
   >RAM +! >RAM @ CONSTANT THIRD-ARRAY 100 >RAM +!

   Notice that after defining each array, we increment the pointer by
   the size of the new array to show that we’ve allocated that much
   additional RAM.

   To make the above more readable, we might add these two definitions:

   : THERE ( – address of next free byte in RAM) >RAM @ ; : RAM-ALLOT (
   #bytes to allocate – ) >RAM +! ;

   We can now rewrite the above equivalently as:

   THERE CONSTANT FIRST-ARRAY 8 RAM-ALLOT THERE CONSTANT SECOND-ARRAY 6
   RAM-ALLOT THERE CONSTANT THIRD-ARRAY 100 RAM-ALLOT

   (An advanced Forth programmer would probably combine these operations
   into a single defining word, but that whole topic is not germane to
   what I’m leading up to.)

   Finally, suppose we have 20 such array definitions scattered
   throughout our application.

   Now, the problem: Somehow the architecture of our system changes and
   we decide that we must allocate this memory such that it *ends* at
   address . In other words, we must start at the end, allocating arrays
   backwards. We still want each array name to return its *starting*
   address, however.

   To do this, we must now write:

   F000 >RAM ! ( EFFF, last byte, plus one) : THERE ( – address of next
   free byte in RAM) >RAM @ ; : RAM-ALLOT ( #bytes to allocate) NEGATE
   >RAM +! ; 8 RAM-ALLOT THERE CONSTANT FIRST-ARRAY 6 RAM-ALLOT THERE
   CONSTANT SECOND-ARRAY 100 RAM-ALLOT THERE CONSTANT THIRD-ARRAY

   This time *decrements* the pointer. That’s okay, it’s easy to add to
   the definition of . Our present concern is that each time we define
   an array we must *before* defining it, not after. Twenty places in
   our code need finding and correcting.

   The words and are nice and friendly, but they didn’t succeed at
   hiding *how* the region is allocated. If they had, it wouldn’t matter
   which order we invoked them in.

   At long last, our question: What could we have done to and to
   minimize the impact of this design change? (Again, the answer I’m
   looking for has nothing to do with defining words.)
