#!/usr/bin/env bash
################################################################################
buf=$(mktemp tmp.XXXXXXX)
head -10 ~/.bash_history > $buf
cat /dev/urandom | hexdump -C | head -10 >> $buf
echo -n "Add some salt:"
read salt
number=$(echo $salt | cat - $buf | md5)
echo "Hex              : $number"
echo "Groß + klein     :" $(transform-big-int.py "0123456789abcdef" "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" "$number")
echo "Mit Sonderzeichen:" $(transform-big-int.py "0123456789abcdef" "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!%$*&=+" "$number")
rm -f $buf
