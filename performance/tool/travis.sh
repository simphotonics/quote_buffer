#!/bin/bash --

# Running QuoteBuffer benchmark

# Defining colours
GREEN='\033[1;32m'

# Exit immediately if a command exits with a non-zero status.
set -e

# Running benchmark
echo
echo -e "${GREEN}=== Running Benchmark $PWD...${RESET}"
echo

dart ./bin/benchmark.dart
