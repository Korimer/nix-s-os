#!/usr/bin/env zsh

displaycount=$(sudo ddcutil detect | grep Display | wc -l)

for i in {1..$displaycount}; do sudo ddcutil setvcp 10 $1 --display $i; done
