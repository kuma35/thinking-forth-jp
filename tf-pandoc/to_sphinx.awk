# -*- Coding:utf-8;Mode: AWK/l;-*-
# pandoc output reST to sphinx-reST.
# local same mini-mini converting.

/^::$/ {
    # no print drop this line
    getline	# drop next line	
    next
}

/^[ ]+\.\.[ ]figure::/ {
    sub(/^[ \t]+/, "")
    print
    getline
    for (i = 0; i < 3; i++ ) {
	sub(/^[ \t]+/, "")
	printf("   %s\n", $0) # lead 3 spaces
	getline
    }
    print	""	# blank line
    next
}

{ print  }
