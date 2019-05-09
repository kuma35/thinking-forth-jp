# -*- Coding:utf-8;Mode: AWK/l;-*-
# pandoc output reST to sphinx-reST.
# local same mini-mini converting.

#::
#
#    .. figure:: img1-004.png
#       :alt: So then I typed GOTO 500---and here I am!
#
#       So then I typed GOTO 500---and here I am!
#
#   ----- CUT HERE -----
#

# convert to ...

#.. figure:: img1-004.png
#   :alt: So then I typed GOTO 500---and here I am!
#
#   So then I typed GOTO 500---and here I am!
#

/^::$/ {
    # no print drop this line
    getline	# drop next line	
    next
}

/^[ ]+\.\.[ ](figure|table)::/ {
    match($0,  /^[ \t]+/)
    lead_count = RLENGTH
    sub(/^[ \t]+/, "")
    print	# print ..figure:: itself.
    getline
    while (!match($0, "----- CUT HERE, kuma35 -----")) {
	for (i = 0; i < lead_count; i++ ) { # max delete lead_count spaces.
	    sub(/^[ \t]/, "")
	}
	print
	getline
    }
    next
}

/^[ ]+\.\.[ ](code-block)::/ {
    match($0,  /^[ \t]+/)
    lead_count = RLENGTH
    sub(/^[ \t]+/, "")
    print	# print ..figure:: itself.
    getline
    while (!match($0, "----- CUT HERE, kuma35 -----")) {
	for (i = 0; i < lead_count; i++ ) { # max delete lead_count spaces.
	    sub(/^[ \t]/, "")
	}
	print "   " $0
	getline
    }
    next
}

{ print  }
