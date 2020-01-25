#!/bin/bash --

# Running QuoteBuffer benchmark

# Defining colours
BLUE='\033[1;34m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Exit immediately if a command exits with a non-zero status.
set -e

# Folder name
FOLDER=$(basename $PWD)

# Resolving dependencies
echo
echo -e "${CYAN}=== Preparing Benchmark $PWD...${RESET}"
echo

# Resolving dependencies
echo
echo -e "${BLUE}=== Resolving Dependencies $PWD...${RESET}"
echo

# Make sure .dart_tool/package_config.json exists.
pub get

# Upgrade packages.
pub upgrade

# Analyze dart files
echo
echo -e "${BLUE}=== Analyzing $PWD...${RESET}"
echo

dartanalyzer \
    --fatal-warnings \
    --fatal-infos \
    --packages="$PWD/.packages" \
    $(find bin lib test -name \*.dart 2>/dev/null)


# Running benchmark
echo
echo -e "${GREEN}=== Running Benchmark $PWD...${RESET}"
echo

dart ./bin/benchmark.dart
