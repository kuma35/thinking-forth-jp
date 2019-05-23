# -*- Coding:utf-8;Mode: AWK/l;-*-
# Thinking Forth latex file split.
# awk -f tf-slice.awk chapter1.tex
# to chapter1.00.tex, chapter1.01.tex,...
# to chapter1.re.tex for references
BEGIN {
    out_file_fmt = "%s.%02d.tex"
    out_ref_fmt = "%s.re.tex"
    section= 0
    base_name = ARGV[1]
    sub(/\.[^/.]*$/, "",  base_name)
    out_file = sprintf(out_file_fmt,  base_name,  section++)
    print out_file
}

/\\section/ {
    close(out_file)
    out_file = sprintf(out_file_fmt,  base_name,  section++)
}

/\\begin{references}/  {
    close(out_file)
    out_file = sprintf(out_ref_fmt,  base_name)
    print $0 >> out_file
    while  (getline) {
	print $0 >> out_file
	if (match($0, "\\end{references}")) {
	    break
	}
    }
    out_file = sprintf(out_file_fmt,  base_name,  section)
    next
}

{
    print $0 >> out_file
}
