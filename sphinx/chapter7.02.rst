The Stylish Return Stack
========================

What about this use of the return stack to hold temporary arguments? Is
it good style or what?

Some people take great offense to its use. But the return stack offers
the simplest solution to certain gnarly stack jams. Witness the
definition of in the previous section.

If you decide to use the return stack for this purpose, remember that
you are using a component of Forth for a purpose other than that
intended. (See the section called “Sharing Components,” later in this
chapter.)

Here’s some suggestions to keep you from shooting yourself in the foot:

#. Keep return stack operators symmetrical.

#. Keep return stack operators symmetrical under all control flow
   conditions.

#. In factoring definitions, watch out that one part doesn’t contain one
   return stack operator, and the other its counterpart.

#. If used inside a , return stack operators must be symmetrical within
   the loop, and is no longer valid in code bounded by and .

For every there must be a in the same definition. Sometimes the
operators will appear to be symmetrical, but due to the control
structure they aren’t. For instance:

... BEGIN ... >R ... WHILE ... R> ... REPEAT

If this construction is used in the outer loop of your application,
everything will run fine until you exit (perhaps hours later) when
you’ll suddenly blow up. The problem? The last time through the loop,
the resolving has been skipped.
