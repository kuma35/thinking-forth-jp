Naming Conventions
==================

| ll>l *Meaning*\ &\ *Form*\ &
| integer 1&1name&1+
| integer 2&2name&2\*
| takes relative input parameters&+name&+DRAW
| takes scaled input parameters&+name&\*DRAW
| start of “high-level” code&name:&CASE:
| end of “high-level” code&;name&;CODE
| put something into dictionary&name,&C,
| executes at compile time&[name]&[COMPILE]
| slightly different&name’ (prime)&CR’
| internal form or primitive&(name)&(TYPE)
| &or <name>&<TYPE>
| compiling word run-time part:
|   systems with no folding&lower-case&if
|   systems with folding&(NAME)&(IF)
| defining word&:name&:COLOR
| block-number where overlay begins&nam\ **ING**\ &DISKING
| table or array&names&EMPLOYEES
| total number of elements&#name&#EMPLOYEES
| current item number (variable)&name#&EMPLOYEE#
| sets current item&( n) name&13 EMPLOYEE
| advance to next element&+name&+EMPLOYEE
| size of offset to item from&name+&DATE +
|   beginning of structure
| size of (bytes per)&/name&/EMPLOYEE
|   (short for BYTES/name)
| index pointer&>name&>IN
| convert address of structure to&>name&>BODY
|   address of item
| file index&(name)&(PEOPLE)
| file pointer&–name&–JOB
| initialize structure&0name&0RECORD
| backwards&name<&SLIDE<
| forwards&name>&CMOVE>
| from&<name&<TAPE
| to&>name&>TAPE
| convert to&name>name&FEET>METERS
| downward&\ :math:`\backslash`\ name&\ :math:`\backslash`\ LINE
| upward&/name&/LINE
| open&{name&{FILE
| close&}name&}FILE
| return boolean value&name?&SHORT?
| returns reversed boolean&-name?&-SHORT?
| address of boolean&’name?&’SHORT?
| operates conditionally&?name&?DUP
| &&
| enable&+name&+CLOCK
|   or, absence of symbol&name&BLINKING
| disable&-name&-CLOCK
| &&-BLINKING
| save value of&@name&@CURSOR
| restore value of&!name&!CURSOR
| store into&name!&SECONDS!
| fetch from&name@&INDEX@
| name of buffer&:name&:INSERT
| address of name&’name&’S
| address of pointer to name&’name&’TYPE
| exchange, especially bytes&>name<&>MOVE<
| byte length&Cname&C@
| 2 cell size, 2’s complement&Dname&D+
|   integer encoding
| mixed 16 and 32-bit operator&Mname&M\*
| 3 cell size&Tname&T\*
| 4 cell size&Qname&Q\*
| unsigned encoding&Uname&U.
| print item&.name&.S
| print numeric (name denotes type)&name.&D. , U.
| print right justified&name.R&U.R
| “per”&/name&/SIDE
| start&<name&<#
| end&name>&#>
| string follows delimited by ”&name”&ABORT” text”
| text or string operator&“name&“COMPARE
|   (similar to $ prefix in BASIC)
| superstring array&“name”&“COLORS”

*How to Pronounce the Symbols*

+----------------------------------------------------------------------+--------------------------------------------------+
| !                                                                    | store                                            |
+----------------------------------------------------------------------+--------------------------------------------------+
| @                                                                    | fetch                                            |
+----------------------------------------------------------------------+--------------------------------------------------+
| #                                                                    | sharp (or “number,” as in #RECORDS)              |
+----------------------------------------------------------------------+--------------------------------------------------+
| $                                                                    | dollar                                           |
+----------------------------------------------------------------------+--------------------------------------------------+
| %                                                                    | percent                                          |
+----------------------------------------------------------------------+--------------------------------------------------+
|                                                                      | caret                                            |
+----------------------------------------------------------------------+--------------------------------------------------+
| &                                                                    | ampersand                                        |
+----------------------------------------------------------------------+--------------------------------------------------+
| \*                                                                   | star                                             |
+----------------------------------------------------------------------+--------------------------------------------------+
| (                                                                    | left paren; paren                                |
+----------------------------------------------------------------------+--------------------------------------------------+
| )                                                                    | right paren; paren                               |
+----------------------------------------------------------------------+--------------------------------------------------+
| –                                                                    | dash; not                                        |
+----------------------------------------------------------------------+--------------------------------------------------+
| +                                                                    | plus                                             |
+----------------------------------------------------------------------+--------------------------------------------------+
| =                                                                    | equals                                           |
+----------------------------------------------------------------------+--------------------------------------------------+
| { }                                                                  | braces (traditionally called “curly brackets”)   |
+----------------------------------------------------------------------+--------------------------------------------------+
| [ ]                                                                  | square brackets                                  |
+----------------------------------------------------------------------+--------------------------------------------------+
| “&quote                                                              |                                                  |
| ’&as prefix: tick; as suffix: prime                                  |                                                  |
| &tilde                                                               |                                                  |
| :math:`|`\ &bar                                                      |                                                  |
| :math:`\backslash`\ &backslash. (also “under,” “down,” and “skip”)   |                                                  |
| /&slash. (also “up”)                                                 |                                                  |
| <&less-than                                                          |                                                  |
| &left dart                                                           |                                                  |
| >&greater-than                                                       |                                                  |
| &right dart                                                          |                                                  |
| ?&question (some prefer “query”)                                     |                                                  |
| ,&comma                                                              |                                                  |
| .&dot                                                                |                                                  |
+----------------------------------------------------------------------+--------------------------------------------------+
