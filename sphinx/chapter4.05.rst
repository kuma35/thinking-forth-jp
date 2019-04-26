Algorithms and Data Structures
==============================

In we learned how to describe a problem’s requirements in terms of
interfaces and rules. In this section we’ll refine the conceptual model
for each component into clearly defined algorithms and data structures.

An algorithm is a procedure, described as a finite number of rules, for
accomplishing a certain task. The rules must be unambiguous and
guaranteed to terminate after a finite number of applications. (The word
is named for the ninth century Persian mathematician .)

An algorithm lies halfway between the imprecise directives of human
speech, such as “Please sort these letters chronologically,” and the
precise directives of computer language, such as “ …” etc. The algorithm
for sorting letters chronologically might be this:

#. Take an unsorted letter and note its date.

#. Find the correspondence folder for that month and year.

#. Flip through the letters in the folder, starting from the front,
   until you find the first letter dated later than your current letter.

#. Insert your current letter just in front of the letter dated later.
   (If the folder is empty, just insert the letter.)

There may be several possible algorithms for the same job. The algorithm
given above would work fine for folders containing ten or fewer letters,
but for folders with a hundred letters, you’d probably resort to a more
efficient algorithm, such as this:

#. (same)

#. (same)

#. If the date falls within the first half of the month, open the folder
   a third of the way in. If the letter you find there is dated later
   than your current letter, search forward until you find a letter
   dated the same or before your current letter. Insert your letter at
   that point. If the letter you find is dated earlier than your current
   letter, search backward…

… You get the point. This second algorithm is more complicated than the
first. But in execution it will require fewer steps on the average
(because you don’t have to search clear from the beginning of the folder
every time) and therefore can be performed faster.

A data structure is an arrangement of data or locations for data,
organized especially to match the problem. In the last example, the file
cabinet containing folders and the folders containing individual letters
can be thought of as data structures. The new conceptual model includes
the filing cabinets and folders (data structures) plus the steps for
doing the filing (algorithms).
