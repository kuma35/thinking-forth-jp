# -*- Coding:utf-8;Mode: AWK/l;-*-
# \person{hoge} convert to hoge.
# \chap{[1-8]} convert to Chapter One , Two ... Eight
{
    gsub(/\\Chap\{1\}/, "Chapter One")
    gsub(/\\Chap\{2\}/, "Chapter Two")
    gsub(/\\Chap\{3\}/, "Chapter Three")
    gsub(/\\Chap\{4\}/, "Chapter Four")
    gsub(/\\Chap\{5\}/, "Chapter Five")
    gsub(/\\Chap\{6\}/, "Chapter Six")
    gsub(/\\Chap\{7\}/, "Chapter Seven")
    gsub(/\\Chap\{8\}/, "Chapter Eight")
    $0 = gensub(/\[\\vbox to\\ht\\strutbox\{\\vss\\hbox to 0pt\{\\hss\\includegraphics\{[^}]+\} \}\\vss\}([^]]+)\]/, "[\\1]", "g")
    print gensub(/\\person{([^}]+)}/, "\\1", "g")
}
