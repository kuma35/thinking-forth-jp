The Limitations of Planning
===========================

Experience has taught us to map out where we’re going before we begin
coding. But planning has certain limitations. The following interviews
give different perspectives to the value of planning.

Despite ’s preference for a well-planned project, he suggests that the
choice between a top-down and bottom-up approach may depend on the
situation:

On two recent projects involving a lot of technical interface work, I
did the whole thing bottom-up. I milled around in a bunch of data-sheets
and technical descriptions of little crannies of the operating system I
was dealing with. I felt lost most of the time, wondering why I ever
took the job on. Then finally I reached a critical mass of some sort and
began putting small programs together that made small things happen. I
continued, bottom-up, until I matched the target application.

My top-down sense was appalled at this procedure. But I’ve seen me go
through this process successfully too many times to discount it for any
pedagogical reasons. And there is always this difficult phase which it
seems no amount of linear thinking will penetrate. Programming seems a
lot more intuitive than we, in this business, tell each other it ought
to be.

I think if the application elicits this sense of being lost, I proceed
bottom-up. If the application is in familiar territory then I’ll
probably use a more traditional by-the-book approach.

And here’s another view:

At the time I interviewed him, of Union Carbide was putting the final
touches on two applications involving user-configurable laboratory
automation and process control automation systems. For the pilot plant
system, designed both the hardware and software to known requirements;
on the laboratory automation system he also defined the requirements
himself.

His efforts were extremely successful. On one project, the new system
typically costs only 20% as much as the equivalent system and requires
days, instead of months, to install and configure.

I asked him what techniques of project management he employed.

On both of these projects much design was needed. I did not follow the
traditional analysis methods, however. I did employ these steps:

First, I clearly defined the boundaries of the problem.

Second, I determined what the smaller functional pieces, the software
subsystems, had to be.

Third, I did each piece, put them together, and the system ran.

Next, I asked the users “Does this meet your requirements?” Sometimes it
didn’t, and in ways that neither the users nor the specification
designers could have anticipated.

For instance, the designers didn’t realize that the original
specification wouldn’t produce pleasing, human-oriented graphics
displays. After working with the interactive graphics on the first
version, users were applying arbitrary scales and coming up with oddball
displays.

So even after the basic plot algorithm was designed, we realized we
needed auto-scaling. We went back in and analyzed how human beings plot
data and wrote a first level plot function that evaluates the x and y
data and how much will fit on the graph.

After that, we realized that not all the data taken will be of interest
to experimenters. So we added a zoom capability.

This iterative approach resulted in cleaner code and better thought out
code. We established a baseline set of goals and built a minimal system
to the users’ known requirements. Then we’d crank in the programmer’s
experience to improve it and determine what the users forgot they needed
when they generated the specs.

The users did not invent most of the new ideas. The programmers did, and
they would bounce these ideas off the users. The problem definition was
a two-way street. In some cases they got things they didn’t know they
could do on such a small computer, such as applying digital filters and
signal processing to the data.

One of the things about Forth that makes this approach possible is that
primitives are easily testable. It takes some experience with Forth to
learn how to take advantage of this. Guys from traditional environments
want to write ten pages of code at their desk, then sit down to type it
in and expect it to work.

To summarize my approach: I try to find out from the users what they
need, but at the same time recognizing its incompleteness. Then I keep
them involved in the design during the implementation, since they have
the expertise in the application. When they see the result, they feel
good because they know their ideas were involved.

The iterative approach places highest value on producing a good solution
to the real problem. It may not always give you the most predictable
software costs. The route to a solution may depend upon your priorities.
Remember:

Good

Fast

Cheap

Pick any two!

As observes, you don’t know completely what you’re doing till you’ve
done it once. In my own experience, the best way to write an application
is to write it twice. Throw away the first version and chalk it up to
experience.

is Senior Technical Staff in the IBM Federal Systems Division, Oswego,
New York:

One of the key advantages I find in Forth is that it allows me to very
quickly prototype an application without all the bells and whistles, and
often with significant limitations, but enough to wring out the “human
interface” by hands-on trial runs.

When I build such a prototype, I do so with the firm constraint that I
will use not a single line of code from the prototype in the final
program. This enforced “do-over” almost always results in far simpler
and more elegant final programs, even when those programs are written in
something other than Forth.

Our conclusions? In the Forth environment planning is necessary. But it
should be kept short. Testing and prototyping are the best ways to
discover what is really needed.

A word of caution to project managers: If you’re supervising any
experienced Forth programmers, you won’t have to worry about them
spending too much time on planning. Thus the following tip has two
versions:

For newcomers to Forth (with “traditional” backgrounds): Keep the
analysis phase to a minimum.

For Forth addicts (without a “traditional” background): Hold off on
coding as long as you can possibly stand it.

Or, as we observed in :

Plan for change (by designing components that can be changed).

Or, simply:

Prototype.
