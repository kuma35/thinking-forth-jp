# -*- Coding:utf-8;Mode: GNUmakefile;-*-
#
# *.tex is Thinking Forth LaTeX souce (original).
# *.s.tex was processd by sed.
# *.p.rst was processed by pandoc. not yet for sphinx-reST.
# *.rst is for Sphinx reST.
#  YOU DIFF *.rst and sphinx/*.rst then update sphinx *.rst and po files.
#
AWK = awk
SED = sed
PANDOC = pandoc

ORG = ../thinking-forth-1.0
DST = ../sphinx

.PHONY : all

all:  %.rst

%.s.tex : %.tex
	$(SED) -f tex-header.sed $<  > $@

%.p.rst : %.s.tex
	$(PANDOC)   -f latex -t rst $< > $@

%.rst : %.p.rst
	$(AWK) -f to_sphinx.awk $< > $@
