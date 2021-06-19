#!/bin/sh -l

export GITHUB_ACCESS_TOKEN=${1}
export REPOSITORY_NAME=${2}

# Compile sherlock.c file
gcc -o sherlock sherlock.c
chmod +x sherlock

# Run python script to download all pull requests
python3 main.py "${GITHUB_ACCESS_TOKEN}" "${REPOSITORY_NAME}"

# Launch sherlock for repositories
./sherlock -e swift $(echo ./repositories/*)