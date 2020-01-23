#!/bin/bash --

# Defining colours
BLUE='\033[1;34m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Exit immediately if a command exits with a non-zero status.
set -e

# for directory in $directories; do
#   echo
#   echo "*** Formatting $directory..."
#   echo
#   cd "$parent_directory/$directory"

#   dartfmt -w $(find bin lib test -name \*.dart 2>/dev/null)
# done


# Resolving dependencies
echo
echo -e "${BLUE}=== Resolving dependencies $PWD...${RESET}"
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

# Running tests
echo
echo -e "${CYAN}=== Testing $PWD...${RESET}"
echo

# Only run libary has test dependency
grep -q test pubspec.yaml && \
pub run test

# Running benchmark
cd performance
echo
echo -e "${GREEN}=== Running Benchmark $PWD...${RESET}"
echo

pub get
pub upgrade
dartanalyzer --fatal-warnings --fatal-infos *.dart
dart ./benchmark.dart

# Running example
cd ../example
echo
echo -e  "${YELLOW}=== Running Examples in $PWD...${RESET}"
echo

pub get
pub upgrade


dart ./example.dart
dartanalyzer --fatal-warnings --fatal-infos *.dart

echo
dart ./example_code_gen.dart