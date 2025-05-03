#!/bin/bash

# Get the directory this script is located in
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR" || exit 1

find . -type f \( -name "*.cpp" -o -name "*.hpp" \) -print0 | xargs -0 -I{} clang-format -i {} --Werror -style=file:.clang_format
