#!/usr/bin/env bash

working_directory="benchmarks"

for benchmark_directory in $(
  find "${working_directory}" -maxdepth 1 -type d ! -name '.*' ! -wholename "${working_directory}"
); do
  rm -rf "${benchmark_directory}";
done
