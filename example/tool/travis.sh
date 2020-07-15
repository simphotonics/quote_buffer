#!/bin/bash --

# Running QuoteBuffer example.

# Defining colours
GREEN='\033[1;32m'

# Exit immediately if a command exits with a non-zero status.
set -e

echo
echo -e "${GREEN}=== Running Example $PWD...${RESET}"
echo

dart ./bin/example.dart
