From 
=====

The implementation of will depend on how your system implements s. If
keeps two items on the return stack (the index and the limit), must drop
both of them plus one more return-stack item to exit:

: LEAP R> R> 2DROP R> DROP ;

If keeps *three* items on the return stack, it must be defined:

: LEAP R> R> 2DROP R> R> 2DROP ;
