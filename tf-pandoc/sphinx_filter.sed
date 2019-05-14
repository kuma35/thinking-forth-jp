# -*- Coding:utf-8 -*-
# output rst of pandoc filter to sphinx rst
# insert blank line each file top.
# sed with -r option ( extend regex)
1i\

s/:raw-latex:`\\cite\{([^}]*)\}`/[\1]_/g

