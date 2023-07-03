#!/bin/bash
# This script generates input files for all benchmarks in this directory

./bench_to_input.sh automata_inclusion "result.*"
./bench_to_input.sh bool_comb "result.*"
./bench_to_input.sh email_filter "result.*"
./bench_to_input.sh ltl_afa
./bench_to_input.sh noodler
./bench_to_input.sh stranger_afa
