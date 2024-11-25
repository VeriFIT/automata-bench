#!/usr/bin/env bash

CONVERTER="convert-for-checkers.sh"

if [ ! -f "$(command -v $CONVERTER)" ] || [ ! -x "$(command -v $CONVERTER)" ]; then
    echo "[!] Missing `convert-for-checkers.sh` script needed for conversion of the benchmarks"
    echo ""
    echo "We recommend of the following: "
    echo "   1. Check our VM (available from our site https://www.fit.vutbr.cz/research/groups/verifit/tools/afa-comparison/), which contains the `convert-for-checkers` script already installed"
    echo "   2. Run and build the converters yourself. See https://github.com/jurajsic/automata-safa, which contains the original scripts and `dockerfile` with further instructions"
fi

echo "Converting benchmarks to .aig/.afasat/.ada/.bisim formats."
echo "Warning: This will take some time (days or hours)."

worklist=()
if [ $# -eq 0 ]; then
    worklist=("automata_inclusion" "bool_comb" "email_filter" "ltl_afa" "noodler" "stranger_afa")
else
    worklist=("$@")
fi

export Aiger=true
export Afasat=true
export Ada=true
export Bisim=true

# Trapping tear down, to assure that the values will be reset to false
function teardown {
    echo "Restoring the environmental variables to false"
    export Aiger=false
    export Afasat=false
    export Ada=false
    export Bisim=false
}
trap teardown EXIT

# Iterates over everything and generates other formats
for directory in "benchmarks/${worklist[@]}"; do
    echo "Converting benchmarks in 'benchmarks/${directory}'"
    $CONVERTER $directory
    echo "$directory complete"
done
