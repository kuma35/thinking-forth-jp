# -*- Coding:utf-8 -*-
# output rst of pandoc filter to sphinx rst
# insert blank line each file top.
# sed with -r option ( extend regex)
1i\

s/:raw-latex:`\\cite\{([^}]*)\}`/[\1]_/g

s/:raw-latex:`\\[Ff]ig\{(fig[0-9]+-[0-9]+)\}`/ :numref:`\1` /g
s/:raw-latex:`\\pageref\{fig-fig1-4\}`/ :numref:`fig1-4` /g
