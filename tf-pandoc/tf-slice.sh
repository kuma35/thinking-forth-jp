#!/bin/sh
# BEFORE run make.
for f in ../thinking-forth-1.0/*.tex ; do
    awk -f tf-slice.awk $f
done
mv ../thinking-forth-1.0/*.??.tex .
