# raw-latex.sed with -E
# multi-line replace.
#
# gnu sed ver 4.4 over
v 4.4
# append pattern-space contents to hold-space at
# all line (not last lines and a last line)
$! {
H
# clear pattern-space(then not print per line)
# and skip follow commands then start next cycle.
d
}
$ {
H
# swap pattern-space and hold-space.
x
s/:raw-latex:`\\(Chapmark|allowhyphens|appendix|epilog|index|initialb|penalty|program|sf|sloppy|vline)[^`]*`//g
s/:raw-latex:`\\person\{([^}]*)\}`/\1/g
# hogebreak ends a paragraph :-)
s/:raw-latex:`\\(big|good|med|small)break`/\n\n/g
s/:raw-latex:`\\bs`/\\/g
}
# because sed program terminate,
# auto print pattern-space content.
