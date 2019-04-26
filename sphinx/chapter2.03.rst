The Value of Planning
=====================

In the nine phases at the start of this chapter we listed five steps
*before* “implementation.” Yet in we saw that an overindulgence in
planning is both difficult and pointless.

Clearly you can’t undertake a significant software project—regardless of
the language—without some degree of planning. Exactly what degree is
appropriate?

More than one Forth programmer has expressed high regard for ’s
meticulous approach to planning. is supervisor at Moore Products Co. in
Springhouse, Pennsylvania. The firm specializes in industrial
instrumentation and process control applications. Dave has been using
Forth since 1978.

He describes his approach:

Compared with many others that use Forth, I suppose we take a more
formal approach. I learned this the hard way, though. My lack of
discipline in the early years has come back to haunt me.

We use two tools to come up with new products: a functional
specification and a design specification. Our department of Sales &
Applications comes up with the functional specification, through
customer contact.

Once we’ve agreed on what we’re going to do, the functional
specification is turned over to our department. At that point we work
through a design, and come up with the design specification.

Up to this point our approach is no different from programming in any
language. But with Forth, we go about designing somewhat differently.
With Forth you don’t have to work 95% through your design before you can
start coding, but rather 60% before you can get into the iterative
process.

A typical project would be to add a functional enhancement to one of our
products. For example, we have an intelligent terminal with disk drives,
and we need certain protocols for communicating with another device. The
project to design the protocols, come up with displays, provide the
operator interfaces, etc. may take several months. The functional
specification takes a month; the design specification takes a month;
coding takes three months; integration and testing take another month.

This is the typical cycle. One project took almost two years, but six or
seven months is reasonable.

When we started with Forth five years ago, it wasn’t like that. When I
received a functional specification, I just started coding. I used a
cross between top-down and bottom-up, generally defining a structure,
and as I needed it, some of the lower level, and then returning with
more structure.

The reason for that approach was the tremendous pressure to show
something to management. We wound up never writing down what we were
doing. Three years later we would go back and try to modify the code,
without any documentation. Forth became a disadvantage because it
allowed us to go in too early. It was fun to make the lights flash and
disk drives hum. But we didn’t go through the nitty-gritty design work.
As I said, our “free spirits” have come back to haunt us.

Now for the new programmers, we have an established requirement: a
thorough design spec that defines in detail all the high-level Forth
words—the tasks that your project is going to do. No more reading a few
pages of the functional specification, answering that, reading a few
more, answering that, etc.

No living programmer likes to document. By ensuring the design ahead of
time, we’re able to look back several years later and remember what we
did.

I should mention that during the design phase there is some amount of
coding done to test out certain ideas. But this code may not be part of
the finished product. The idea is to map out your design.

advises us to complete the design specification before starting to code,
with the exception of needed preliminary tests. The next interview backs
up this point, and adds some additional reasons.

has been an independent software consultant since 1976, specializing in
custom applications for academic research environments. He enjoys
providing research tools “right at the edge of what technology is able
to do.” works in Rochester, New York:

I see the software development process as having two phases. The first
is making sure I understand what the problem is. The second is
implementation, including debugging, verification, etc.

My goal in Phase One is an operational specification. I start with a
problem description, and as I proceed it becomes the operational
specification. My understanding of the problem metamorphoses into a
solution. The better the understanding, the more complete the solution.
I look for closure; a sense of having no more questions that aren’t
answered in print.

I’ve found that on each project I’ve been putting more time into Phase
One, much to the initial dismay of many of my clients. The limiting
factor is how much I can convince the client it’s necessary to spend
that time up front. Customers generally don’t know the specifications
for the job they want done. And they don’t have the capital—or don’t
feel they do—to spend on good specs. Part of my job is to convince them
it will end up costing more time and money not to.

Some of Phase One is spent on feasibility studies. Writing the spec
unearths uncertainties. I try to be as uncertain about uncertainties as
possible. For instance, they may want to collect 200,000 samples a
second to a certain accuracy. I first need to find out if it’s even
possible with the equipment they’ve got. In this case I’ve got to test
its feasibility by writing a patch of code.

Another reason for the spec is to cover myself. In case the application
performs to the spec but doesn’t fully satisfy the customer, it’s the
customer’s responsibility. If the customer wants more, we’ll have to
renegotiate. But I see it as the designer’s responsibility to do
whatever is necessary to generate an operational specification that will
do the job to the customer’s satisfaction.

I think there are consultants who bow to client pressure and limit the
time they spend on specs, for fear of losing the job. But in these
situations nobody ends up happy.

We’ll return to the interview momentarily.
