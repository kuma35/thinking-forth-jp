#. Our solution is as follows:

    CARDS Shuffle 6-20-83 52 CONSTANT #CARDS CREATE DECK #CARDS ALLOT
    one card per byte : CARD ( i – adr) DECK + ; : INIT-DECK #CARDS 0 DO
   I I CARD C! LOOP ; INIT-DECK : ’CSWAP ( a1 a2 – )   swap bytes at a1
   and a2 2DUP C@ SWAP C@ ROT C! SWAP C! ; : SHUFFLE   shuffle deck of
   cards #CARDS 0 DO I CARD #CARDS CHOOSE CARD ’CSWAP LOOP ;
