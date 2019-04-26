Vectored Execution
==================

Vectored execution extends the ideas of currentness and indirection
beyond data, to functions. Just as we can save values and flags in
variables, we can also save functions, because functions can be referred
to by address.

The traditional techniques for implementing vectored execution are
described in *Starting Forth*, Chapter Nine. In this section we’ll
discuss a new syntax which I invented and which I think can be used in
many circumstances more elegantly than the traditional methods.

The syntax is called /. (If your system doesn’t include these words,
refer to for code and implementation details.) It works like this: You
define the word whose behavior will be vectorable with the defining word
, as in

DOER PLATFORM

Initially, the new word does nothing. Then you can write words that
change what does by using the word :

: LEFTWING MAKE PLATFORM .“ proponent ” ; : RIGHTWING MAKE PLATFORM .“
opponent ” ;

When you invoke , the phrase changes what will do. Now if you type ,
you’ll see:

LEFTWING ok PLATFORM &underlineproponent ok

will make display “opponent.” You can use within another definition:

: SLOGAN .“ Our candidate is a longstanding ” PLATFORM .“ of heavy
taxation for business. ” ;

The statement

LEFTWING SLOGAN

will display one campaign statement, while

RIGHTWING SLOGAN

will display another.

The “” code can be any Forth code, as much or as long as you want; just
remember to conclude it with semicolon. The semicolon at the end of
serves for both and for the bit of code after . When redirects execution
of the word, it also *stops* execution of the word in which it appears.

When you invoke , for example, redirects and exits. Invoking does not
cause “proponent” to be printed. demonstrates this point, using a
conceptualized illustration of the dictionary.

If you want to *continue* execution, you can use the word in place of
semicolon. terminates the code that the word points to, and resumes
execution of the definition in which it appears, as you can see in .

Finally, you can chain the “making” of words in series by not using .
explains this better than I could write about it.
