#. The answer depends on whether you believe that other components will
   need to “know the numeric code associated with each key. Usually this
   would *not* be the case. The simpler, more compact form is therefore
   preferable. Also in the first version, to add a new key would require
   a change in two places.

#. The problem with the words and are that they are *time-dependent*: we
   must execute them in a particular order. Our solution then will be to
   devise an interface to the RAM allocation pointer that is not
   dependent on order; the way to do this is to have a *single* word
   which does both functions transparently.

   Our word’s syntax will be

   : RAM-ALLOT ( #bytes-to-allot – starting-adr) ... ;

   This syntax will remain the same whether we define it to allocate
   growing upward:

   : RAM-ALLOT ( #bytes-to-allot – starting-adr) >RAM @ DUP ROT + >RAM !
   ;

   or to allocate growing downward:

   : RAM-ALLOT ( #bytes-to-allot – starting-adr) >RAM @ SWAP - DUP >RAM
   ! ;
