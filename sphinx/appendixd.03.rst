#. This will work:

   20 CHOOSE 2 CHOOSE IF NEGATE THEN

   But this is simpler:

   40 CHOOSE 20 -

: DIRECTION ( n\|-n\|0 – 1\|-1\|0) DUP IF 0< 1 OR THEN ;
