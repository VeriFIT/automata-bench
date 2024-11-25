#!/usr/bin/env bash

# If specified with directory only, it goes through all benchmarks with extensions
if [ "$#" -eq 1 ]; then
  find "$1" -type f -name "*.*" | rev | cut -f 2- -d '.' | rev | sort | uniq > ${1%/}.input
# Otherwise, it restricts the results into selected regular expression only
elif [ "$#" -eq 2 ]; then
  find "$1" -type f -name $2 | rev | cut -f 2- -d '.' | rev | sort | uniq > ${1%/}.input
else
  echo "usage: ./bench_to_input bench_dir [file_filter=*.*]"
fi
