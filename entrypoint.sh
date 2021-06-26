#!/bin/sh -l

export GITHUB_ACCESS_TOKEN=${1}
export REPOSITORY_NAME=${2}

# Compile sherlock.c file
gcc -o sherlock sherlock.c
chmod +x sherlock

# Run python script to download all pull requests
#python3 download.py "${GITHUB_ACCESS_TOKEN}" "${REPOSITORY_NAME}"

# Remove all not .swift files
find ./solutions/ -not -name "*.swift" -type f -delete

# Remove all ignored files
find ./solutions/ -name "AppDelegate.swift" -type f -delete
find ./solutions/ -name "SceneDelegate.swift" -type f -delete
find ./solutions/ -name "*Tests.swift" -type f -delete

for D in $(find ./solutions -mindepth 1 -maxdepth 1 -type d)
do
    # Make every subdirectory flatten
    find "${D}" -mindepth 1 -type f -print -exec mv {} "${D}" \;
    # Remove folders from solutions
    find "${D}" -mindepth 1 -type d -exec rm -rf {} \;
done

mkdir outputs

# Launch sherlock for solutions
cd solutions ; ../sherlock -e swift $(echo ./*) > ../outputs/result.txt ; cd ..

python3 parser.py