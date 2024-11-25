#!/usr/bin/env bash
# This script generates input files for all benchmarks in this directory

./bench_to_input.sh benchmarks/automata_inclusion "result.*"
./bench_to_input.sh benchmarks/bool_comb "result.*"
./bench_to_input.sh benchmarks/email_filter "result.*"
./bench_to_input.sh benchmarks/ltl_afa
./bench_to_input.sh benchmarks/noodler
./bench_to_input.sh benchmarks/stranger_afa
