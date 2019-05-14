# tex-header.sed
1i% -*- Coding:utf-8;Mode: LaTeX;-*-\n\\\usepackage{tfrst}
s/\xe9/\\\'/
s/\\begin{Code}.*$/\\begin{verbatim}\n.. code-block:: none\n/
s/\\end{Code}/----- CUT HERE, kuma35 -----\n\\end{verbatim}/
