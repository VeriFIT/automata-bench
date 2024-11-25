#!/usr/bin/env bash

working_directory="benchmarks"

for benchmark_directory in $(
 find "${working_directory}" -maxdepth 1 -type d ! -name '.*' ! -wholename "${working_directory}"
); do
  tar -czf - "${benchmark_directory}" \
  | split -b 42M - "${benchmark_directory}.tar.gz.";
done
