# -*- Coding:utf-8;Mode: AWK/l;-*-
# Thinking Forth refrences (LaTeX) convert to sphinx (reST).
BEGIN {
   line = ""
}

/\\begin{references}/  {
    sec_title("REFERNCES")
    next
}

/\\end{references}/ {
    next
}

/\\bibitem{[^}]+}/ {
    if (line != "") {
	line_process(line)
    }
    line = $0
    next
}

{
    line = line $0
}

END {
    line_process(line)
    print ""
}

function line_process (line) {
    line = gensub(/\\bibitem{([^}]+)}/, ".. [\\1] ", 1, line)
    gsub("\\\\@",  "",  line)
    line = gensub(/\\Forth[{][}]/, "Forth", "g",  line)
    line = gensub(/\\copyright[{][}]/, "(C)", "g", line)
    line = gensub(/\\person{([^}]+)}/, "\\1", "g", line)
    line = gensub(/\\emph{([^}]+)}/, " **\\1** ",  "g", line)
    line = gensub(/``([^']+)''/, "\"\\1\"", "g", line)
    print line
}

function sec_title(text) {
    marker = ""
    text_len = length(text)
    for (i = 0; i < text_len; i++) {
	marker = marker "="
    }
    print ""
    print text
    print marker
    print ""
}
