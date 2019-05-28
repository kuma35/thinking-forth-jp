# -*- Coding:utf-8;Mode: AWK/l;-*-
# \person{hoge} convert to hoge.
{
    print gensub(/\\person{([^}]+)}/, "\\1", "g")
}
