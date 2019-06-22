   * - **Arithmetic**
     -
     -
   * - integer 1
     - 1name
     - 1+
   * - integer 2
     - 2name
     - 2*
   * - takes relative input parameters
     - +name
     - +DRAW
   * - takes scaled input parameters
     - +name
     - *DRAW[0.5ex]
   * - **Compilation**
     -
     -
   * - start of ``high-level'' code
     - name:
     - CASE:
   * - end of ``high-level'' code
     - ;name
     - ;CODE
   * - put something into dictionary
     - name,
     - C,
   * - executes at compile time
     - [name]
     - [COMPILE]
   * - slightly different
     - name' (prime)
     - CR'
   * - internal form or primitive
     - (name)
     - (TYPE)
   * - ~~systems with no folding
     - lower-case
     - if
   * - ~~systems with folding
     - (NAME)
     - (IF)
   * - defining word
     - :name
     - :COLOR
   * - block-number where overlay begins
     - nam{\bf ING}
     - DISKING[0.5ex]
   * - **Data Structures**
     -
     -
   * - table or array
     - names
     - EMPLOYEES
   * - sets current item
     - ( n) name
     - 13 EMPLOYEE
   * - advance to next element
     - +name
     - +EMPLOYEE
   * - size of offset to item from
     - name+
     - DATE +
   * - size of (bytes per)
     - /name
     - /EMPLOYEE
   * - index pointer
     - >name
     - >IN
   * - convert address of structure to
     - >name
     - >BODY
   * - file index
     - (name)
     - (PEOPLE)
   * - file pointer
     - --name
     - --JOB
   * - initialize structure
     - 0name
     - 0RECORD[0.5ex]
   * - **Direction, Conversion**
     -
     -
   * - backwards
     - name<
     - SLIDE<
   * - forwards
     - name>
     - CMOVE>
   * - from
     - <name
     - <TAPE
   * - to
     - >name
     - >TAPE
   * - convert to
     - name>name
     - FEET>METERS
   * - upward
     - /name
     - /LINE
   * - **Logic, Control**
     -
     -
   * - return boolean value
     - name?
     - SHORT?
   * - returns reversed boolean
     - -name?
     - -SHORT?
   * - address of boolean
     - 'name?
     - 'SHORT?
   * - operates conditionally
     - ?name
     - ?DUP
   * - enable
     - +name
     - +CLOCK
   * - ~~or, absence of symbol
     - name
     - BLINKING
   * - disable
     - -name
     - -CLOCK
   * - **Memory**
     -
     -
   * - save value of
     - @name
     - @CURSOR
   * - restore value of
     - !name
     - !CURSOR
   * - store into
     - name!
     - SECONDS!
   * - fetch from
     - name@
     - INDEX@
   * - name of buffer
     - :name
     - :INSERT
   * - address of name
     - 'name
     - 'S
   * - address of pointer to name
     - 'name
     - 'TYPE
   * - exchange, especially bytes
     - >name<
     - >MOVE<[0.5ex]
   * - **Numeric Types**
     -
     -
   * - byte length
     - Cname
     - C@
   * - 2 cell size, 2's complement
     - Dname
     - D+
   * - mixed 16 and 32-bit operator
     - Mname
     - M*
   * - 3 cell size
     - Tname
     - T*
   * - 4 cell size
     - Qname
     - Q*
   * - unsigned encoding
     - Uname
     - U.[0.5ex]
   * - **Output, Printing**
     -
     -
   * - print item
     - .name
     - .S
   * - print numeric (name denotes type)
     - name.
     - D. , U.
   * - print right justified
     - name.R
     - U.R[0.5ex]
   * - **Quantity**
     -
     -
   * - ``per''
     - /name
     - /SIDE[0.5ex]
   * - **Sequencing**
     -
     -
   * - **Text**
     -
     -
   * - string follows delimited by ''
     - name''
     - ABORT'' text''
   * - text or string operator
     - ``name
     - ``COMPARE
   * - superstring array
     - ``name''
     - ``COLORS''
