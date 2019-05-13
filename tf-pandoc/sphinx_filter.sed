# -*- Coding:utf-8 -*-
# output rst of pandoc filter to sphinx rst
# sed with -r option ( extend regex)
s/:raw-latex:`\\cite\{([^}]*)\}`/[\1]_/g

