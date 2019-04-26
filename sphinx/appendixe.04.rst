Samples of Good Commenting Style
================================

Here are two sample screens to illustrate good commenting style.

 Formatter Data Structures – p.2 06/06/83 6 CONSTANT TMARGIN  line#
where body of text begins 55 CONSTANT BMARGIN  line# where body of text
ends

CREATE HEADER 82 ALLOT   1left-ent \| 1right-cnt \| 80header CREATE
FOOTER 82 ALLOT   1left-cnt \| 1right-ent \| 80footer

VARIABLE ACROSS  formatter’s current horizontal position VARIABLE
DOWNWARD  formatter’s current vertical position VARIABLE LEFT  current
primary left margin VARIABLE WALL  current primary right margin VARIABLE
WALL-WAS  WALL when curr. line started being formt’d

 Formatter positioning – p.1 06/06/83 : SKIP ( n) ACROSS +! ; : NEWLEFT
 reset left margin LEFT @ PERMANENT @ + TEMPORARY @ + ACROSS ! ; :
 begin new line DOOR CR’ 1 DOWNWARD +! NEWLEFT WALL @ WALL-WAS ! ; :
AT-TOP? ( – t=at-top) TMARGIN DOWNWARD @ = ; : >TMARGIN  move from
crease to TMARGIN O DOWNWARD ! BEGIN AT-TOP? UNTIL ;
