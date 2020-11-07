#!/bin/bash

epochTime=$(date +%s)

wget -q http://linux.dell.com/repo/hardware/latest/bootstrap.cgi -O bootstrap-"$epochTime".sh

file1="bootstrap-1604768608.sh"
file2="bootstrap-$epochTime.sh"

if cmp -s "$file1" "$file2"; then
    printf 'The file "%s" is the same as "%s"\n' "$file1" "$file2"
    rm "$file2"
else
    printf 'The file "%s" is different from "%s"\n' "$file1" "$file2"
fi
