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
SRC_TIT = title.00.tex
SRC_TIT2 = title2.00.tex
SRC_CPY = copyright.00.tex
SRC_BIO = bio.00.tex
SRC_QUO = quotation.00.tex
SRC_PRE04 = preface2004.00.tex
SRC_PRE94 = preface94.00.tex
SRC_PRE = preface.00.tex
# SRC_TOC = tocpages.00.tex tocpages.01.tex
# chapter1.02.tex (chapter1.02.patch)
SRC_CH1 =  chapter1.00.tex chapter1.01.tex chapter1.02.tex chapter1.03.tex \
	chapter1.04.tex chapter1.05.tex chapter1.06.tex chapter1.07.tex \
	chapter1.08.tex chapter1.09.tex chapter1.10.tex
SRC_CH2 = chapter2.00.tex chapter2.01.tex chapter2.02.tex chapter2.03.tex \
	chapter2.04.tex chapter2.05.tex chapter2.06.tex chapter2.07.tex \
	chapter2.08.tex chapter2.09.tex chapter2.10.tex chapter2.11.tex
SRC_CH3 = chapter3.00.tex chapter3.01.tex chapter3.02.tex chapter3.03.tex \
	chapter3.04.tex chapter3.05.tex chapter3.06.tex chapter3.07.tex \
	chapter3.08.tex chapter3.09.tex
SRC_CH4 = chapter4.00.tex chapter4.01.tex chapter4.02.tex chapter4.03.tex \
	chapter4.04.tex chapter4.05.tex chapter4.06.tex chapter4.07.tex \
	chapter4.08.tex chapter4.09.tex
# chapter5.02.tex (chapter5.02.patch)
# chapter5.03.tex (chapter5.03.patch)
SRC_CH5 = chapter5.00.tex chapter5.01.tex chapter5.02.tex  chapter5.03.tex \
	chapter5.04.tex chapter5.05.tex chapter5.06.tex chapter5.07.tex \
	chapter5.08.tex
SRC_CH6 = chapter6.00.tex chapter6.01.tex chapter6.02.tex chapter6.03.tex \
	chapter6.04.tex
SRC_CH7 = chapter7.00.tex chapter7.01.tex chapter7.02.tex chapter7.03.tex \
	chapter7.04.tex chapter7.05.tex chapter7.06.tex chapter7.07.tex \
	chapter7.08.tex chapter7.09.tex chapter7.10.tex chapter7.11.tex
SRC_CH8 = chapter8.00.tex chapter8.01.tex chapter8.02.tex chapter8.03.tex \
	chapter8.04.tex chapter8.05.tex
SRC_EPI = epilog.00.tex
SRC_APPA = appendixa.00.tex appendixa.01.tex appendixa.02.tex \
	appendixa.03.tex appendixa.04.tex appendixa.05.tex
SRC_APPB = appendixb.00.tex
SRC_APPC = appendixc.00.tex appendixc.01.tex appendixc.02.tex \
	appendixc.03.tex
SRC_APPD = appendixd.00.tex appendixd.01.tex appendixd.02.tex \
	appendixd.03.tex
SRC_APPE = appendixe.00.tex appendixe.01.tex appendixe.02.tex \
	appendixe.03.tex appendixe.04.tex appendixe.05.tex
# SRC_APP = $(SRC_APPA) $(SRC_APPB) $(SRC_APPC) $(SRC_APPD) $(SRC_APPE)
SRC_BPK = backpage.00.tex
SRC_COV = cover.00.tex
#SRC_FIG = fig1-1.00.tex fig1-3.00.tex fig1-4.00.tex fig1-6.00.tex \
#	fig7-7.00.tex  fig7-8.00.tex fig7-9.00.tex
# SRC_FIGs to PNG file by Inkscape. :-)
SRC_FIG =  fig1-6.00.tex \
	fig7-7.00.tex  fig7-8.00.tex fig7-9.00.tex # fig1-1.00.tex fig1-3.00.tex fig1-4.00.tex
SRC_LEG = legalcode-by-nc-sa.00.tex legalcode-by-nc-sa.01.tex
SRC_TFO = tfoptions.00.tex
#SRC_TF =   thinking-forth.00.tex thinking-forth.01.tex
# 2019/04/25 19:12 pandoc error
SRC_TF ="" # thinking-forth.00.tex thinking-forth.01.tex

#SRCS = $(SRC_TIT) $(SRC_CPY) $(SRC_BIO) $(SRC_QUO) $(SRC_PRE04) $(SRC_PRE94) \
#	$(SRC_PRE) $(SRC_TOC) $(SRC_CH1) $(SRC_CH2) $(SRC_CH3) $(SRC_CH4) \
#	$(SRC_CH5) $(SRC_CH6) $(SRC_CH7) $(SRC_CH8) $(SRC_EPI) $(SRC_APPA) \
#	$(SRC_APPB) $(SRC_APPC) $(SRC_APPD) $(SRC_APPE)
# delete SRC_TOC
SRCS = $(SRC_TIT) $(SRC_CPY) $(SRC_BIO) $(SRC_QUO) $(SRC_PRE04) $(SRC_PRE94) \
	$(SRC_PRE) $(SRC_CH1) $(SRC_CH2) $(SRC_CH3) $(SRC_CH4) \
	$(SRC_CH5) $(SRC_CH6) $(SRC_CH7) $(SRC_CH8) $(SRC_EPI) $(SRC_APPA) \
	$(SRC_APPB) $(SRC_APPC) $(SRC_APPD) $(SRC_APPE)

OBJS=$(SRCS:.tex=.rst)
 $(warning $(OBJS))

SPX_DIR = ../sphinx

# delete $(SPX_DIR)/tocpages.rst
TGTS= $(SPX_DIR)/title.rst \
	$(SPX_DIR)/copyright.rst \
	$(SPX_DIR)/bio.rst \
	$(SPX_DIR)/quotation.rst \
	$(SPX_DIR)/preface2004.rst \
	$(SPX_DIR)/preface94.rst \
	$(SPX_DIR)/preface.rst \
	$(SPX_DIR)/chapter1.rst 	$(SPX_DIR)/chapter2.rst \
	$(SPX_DIR)/chapter3.rst 	$(SPX_DIR)/chapter4.rst \
	$(SPX_DIR)/chapter5.rst 	$(SPX_DIR)/chapter6.rst \
	$(SPX_DIR)/chapter7.rst 	$(SPX_DIR)/chapter8.rst \
	$(SPX_DIR)/epilog.rst \
	$(SPX_DIR)/appendixa.rst $(SPX_DIR)/appendixb.rst \
	$(SPX_DIR)/appendixc.rst $(SPX_DIR)/appendixd.rst \
	$(SPX_DIR)/appendixe.rst

.PHONY : all

#all:  $(OBJS)
all:  $(TGTS)

clean:
	rm -f $(OBJS) $(TGTS)

%.rst : %.tex tfrst.sty tex-header.sed to_sphinx.awk
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

$(SPX_DIR)/title.rst: $(SRC_TIT:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/copyright.rst: $(SRC_CPY:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/bio.rst: $(SRC_BIO:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/quotation.rst: $(SRC_QUO:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/preface2004.rst: $(SRC_PRE04:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/preface94.rst: $(SRC_PRE94:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/preface.rst: $(SRC_PRE:.tex=.rst)
	cat $+ > $@

#$(SPX_DIR)/tocpages.rst: $(SRC_TOC:.tex=.rst)
#	cat $+ > $@

$(SPX_DIR)/chapter1.rst: $(SRC_CH1:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/chapter2.rst: $(SRC_CH2:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/chapter3.rst: $(SRC_CH3:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/chapter4.rst: $(SRC_CH4:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/chapter5.rst: $(SRC_CH5:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/chapter6.rst: $(SRC_CH6:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/chapter7.rst: $(SRC_CH7:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/chapter8.rst: $(SRC_CH8:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/epilog.rst: $(SRC_EPI:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/appendixa.rst: $(SRC_APPA:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/appendixb.rst: $(SRC_APPB:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/appendixc.rst: $(SRC_APPC:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/appendixd.rst: $(SRC_APPD:.tex=.rst)
	cat $+ > $@

$(SPX_DIR)/appendixe.rst: $(SRC_APPE:.tex=.rst)
	cat $+ > $@

