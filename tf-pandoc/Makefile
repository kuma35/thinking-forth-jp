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


# SRCS = $(wildcard *.??.tex)
SRC_APP = appendixa.00.tex appendixa.01.tex appendixa.02.tex  \
	appendixa.03.tex appendixa.04.tex appendixa.05.tex appendixb.00.tex \
	appendixc.00.tex appendixc.01.tex appendixc.02.tex 	appendixc.03.tex \
	appendixd.00.tex appendixd.01.tex appendixd.02.tex appendixd.03.tex \
	appendixe.00.tex appendixe.01.tex appendixe.02.tex appendixe.03.tex  \
	appendixe.04.tex appendixe.05.tex
SRC_BPK = backpage.00.tex
SRC_BIO = bio.00.tex
#SRC_CH1 =  chapter1.00.tex chapter1.01.tex chapter1.02.tex chapter1.03.tex \
#	chapter1.04.tex chapter1.05.tex chapter1.06.tex chapter1.07.tex \
#	chapter1.08.tex chapter1.09.tex chapter1.10.tex
SRC_CH1 =  chapter1.00.tex chapter1.01.tex chapter1.03.tex \
	chapter1.04.tex chapter1.05.tex chapter1.06.tex chapter1.07.tex \
	chapter1.08.tex chapter1.09.tex chapter1.10.tex # chapter1.02.tex 
SRC_CH2 = chapter2.00.tex chapter2.01.tex chapter2.02.tex chapter2.03.tex \
	chapter2.04.tex chapter2.05.tex chapter2.06.tex chapter2.07.tex \
	chapter2.08.tex chapter2.09.tex chapter2.10.tex chapter2.11.tex
SRC_CH3 = chapter3.00.tex chapter3.01.tex chapter3.02.tex chapter3.03.tex \
	chapter3.04.tex chapter3.05.tex chapter3.06.tex chapter3.07.tex \
	chapter3.08.tex chapter3.09.tex
SRC_CH4 = chapter4.00.tex chapter4.01.tex chapter4.02.tex chapter4.03.tex \
	chapter4.04.tex chapter4.05.tex chapter4.06.tex chapter4.07.tex \
	chapter4.08.tex chapter4.09.tex
#SRC_CH5 = chapter5.00.tex chapter5.01.tex chapter5.02.tex chapter5.03.tex \
#	chapter5.04.tex chapter5.05.tex chapter5.06.tex chapter5.07.tex \
#	chapter5.08.tex
SRC_CH5 = chapter5.00.tex chapter5.01.tex \
	chapter5.04.tex chapter5.05.tex chapter5.06.tex chapter5.07.tex \
	chapter5.08.tex #  chapter5.02.tex chapter5.03.tex
SRC_CH6 = chapter6.00.tex chapter6.01.tex chapter6.02.tex chapter6.03.tex \
	chapter6.04.tex
SRC_CH7 = chapter7.00.tex chapter7.01.tex chapter7.02.tex chapter7.03.tex \
	chapter7.04.tex chapter7.05.tex chapter7.06.tex chapter7.07.tex \
	chapter7.08.tex chapter7.09.tex chapter7.10.tex chapter7.11.tex
SRC_CH8 = chapter8.00.tex chapter8.01.tex chapter8.02.tex chapter8.03.tex \
	chapter8.04.tex chapter8.05.tex
SRC_CPY = copyright.00.tex
SRC_COV = cover.00.tex
SRC_EPI = epilog.00.tex
#SRC_FIG = fig1-1.00.tex fig1-3.00.tex fig1-4.00.tex fig1-6.00.tex \
#	fig7-7.00.tex  fig7-8.00.tex fig7-9.00.tex
SRC_FIG =  fig1-6.00.tex \
	fig7-7.00.tex  fig7-8.00.tex fig7-9.00.tex # fig1-1.00.tex fig1-3.00.tex fig1-4.00.tex
SRC_LEG = legalcode-by-nc-sa.00.tex legalcode-by-nc-sa.01.tex
SRC_PRE = preface.00.tex preface2004.00.tex preface94.00.tex
SRC_QUO = quotation.00.tex
SRC_TFO = tfoptions.00.tex
#SRC_TF =   thinking-forth.00.tex thinking-forth.01.tex
# 2019/04/25 19:12 pandoc error
SRC_TF ="" # thinking-forth.00.tex thinking-forth.01.tex
SRC_TIT = title.00.tex title2.00.tex
SRC_TOC = tocpages.00.tex tocpages.01.tex

SRCS = $(SRC_APP) $(SRC_BPK) $(SRC_BIO) $(SRC_CH1) $(SRC_CH2) $(SRC_CH3) \
	$(SRC_CH4) $(SRC_CH5) $(SRC_CH6) $(SRC_CH7) $(SRC_CH8) $(SRC_CPY) \
	$(SRC_COV) $(SRC_EPI) $(SRC_FIG) $(SRC_LEG) $(SRC_PRE) $(SRC_QUO) \
	$(SRC_TFO)

OBJS=$(SRCS:.tex=.rst)
 $(warning $(OBJS))

.PHONY : all

all:  $(OBJS)

%.rst : %.tex
	$(SED) -f tex-header.sed $<  |  $(PANDOC)   -f latex -t rst | $(AWK) -f to_sphinx.awk  > $@

#%.s.rst: %.tex
#	$(SED) -f tex-header.sed $<  > $@
#
#%.p.rst : %.s.tex
#	$(PANDOC)   -f latex -t rst $< > $@
#
#%.rst : %.p.rst
#	$(AWK) -f to_sphinx.awk $< > $@
#
