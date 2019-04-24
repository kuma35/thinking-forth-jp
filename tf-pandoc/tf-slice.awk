# -*- Coding:utf-8;Mode: AWK/l;-*-
# Thinking Forth latex file split.
# awk -f tf-slice.awk chapter1.tex
# to chapter1-0.tex, chapter1-1.tex,...
BEGIN {
    out_file_fmt = "%s.%02d.tex"
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

{
    print $0 >> out_file
}
