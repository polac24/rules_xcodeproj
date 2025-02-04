#!/bin/bash

set -euo pipefail

root="$PWD"

for dir in examples/*/ ; do
    cd "$root/$dir"
    if [[ ! -f "WORKSPACE" || ! -d "test/fixtures" ]]; then
      continue
    fi

    echo
    echo "Updating \"${dir%/}\" fixtures"
    echo
    USE_BAZEL_VERSION="6.4.0" bazel run --config=cache //test/fixtures:update
done
