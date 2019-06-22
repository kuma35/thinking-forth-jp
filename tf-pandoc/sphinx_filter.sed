# -*- Coding:utf-8 -*-
# output rst of pandoc filter to sphinx rst
# insert blank line each file top.
# sed with -r option ( extend regex)
1i\

s/:raw-latex:`\\if[^`]*`//g
s/:raw-latex:`\\fi`//g
s/:raw-latex:`\\cite\{([^}]*)\}`/[\1]_/g
s/:raw-latex:`\\index[^`]*`//g
s/:raw-latex:`\\poorbf\{([^}]*)\}`/``\1``/g
s/:raw-latex:`\\person\{([^}]*)\}`/\1/g
s/:raw-latex:`\\pagebreak`//g
s/:raw-latex:`\\vspace[^`]*`//g
s/:raw-latex:`\\eightyfour(false|true)`//g
s/:raw-latex:`\\ofour(true|false)`//g
s/:raw-latex:`\\DeclareGraphicsExtensions\{\.png\}`//g
s/:raw-latex:`\\Chapmark\{[1-8]\}`//g
s/:raw-latex:`\\expandafter`//g
s/:raw-latex:`\\initial`//g
s/:raw-latex:`\\medskip`//g
s/:raw-latex:`\\tfversion`/1.0/g
s/:raw-latex:`\\bigskip`//g
s/:raw-latex:`\\vbox`//g
s/:raw-latex:`\\hfill`//g
s/:raw-latex:`\\vfill`//g
s/:raw-latex:`\\ht`//g
s/:raw-latex:`\\tt`//g
s/:raw-latex:`\\isbn`//g
s/:raw-latex:`\\cleardoublepage`//g
s/:raw-latex:`\\setcounter[^`]*`//g
s/:raw-latex:`\\pagenumbering\{[^}]*\}`//g
s/:raw-latex:`\\pagestyle\{[^}]*\}`//g
s/:raw-latex:`\\noindent`//g
s/:raw-latex:`\\[Ff]ig\{(fig[0-9]+-[0-9]+)\}`/ :numref:`\1` /g
s/:raw-latex:`\\-`/-/g
s/:raw-latex:`\\hy`//g
s/:raw-latex:`\\pageref\{fig-fig1-4\}`/ :numref:`fig1-4` /g
s/:raw-latex:`\\pageref\{preface([0-9]+)\}`/ :doc:`preface\1` /g
s/:raw-latex:`\\App\{([A-E])\}`/Appendix \1/g
s/:raw-latex:`\\urlstyle[^`]*`//g
s/:raw-latex:`\\def`//g
s/:raw-latex:`\\UrlLeft`\#1//g
s/:raw-latex:`\\UrlRight[^`]*`//g
s/\\index\{[^}]*\}//g
s/``([^']*)''/"\1"/g
s/\\emph\{([^}]*)\}/**\1**/g
s/\\dots\{\}/.../g
