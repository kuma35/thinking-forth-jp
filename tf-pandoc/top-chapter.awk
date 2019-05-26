# -*- Coding:utf-8;Mode: AWK/l;-*-
# top section change to chapter each *.tex after cat.
#
# chapter name
# ===========
#
# *****************
# 1. chapter name
# *****************

BEGIN {
    #Toc
    #gawk -f top-chapter.awk Toc="1. "
    Cnt = 0
    Last = ""
}

Cnt == 0 && /^[ \t]*[=]+[ \t]*$/ {
    Cnt ++
    title = Toc Last
    marker = ""
    for (i = 0; i< length(title); i++) {
	marker = marker "*"
    }
    print ""
    print marker	# chapter marker ***...
    print title	# title
    print marker	# chapter marker ***...
    Last = ""
    next
}

{
    print Last
    Last = $0
}

END {
    print Last
}
