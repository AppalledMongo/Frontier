#!/usr/bin/env bash
set -euo pipefail

echo "=========================================="
echo "MONGO ENGINE - BRICK 019.19.2"
echo "CHECKPOINT BUILD // INCREMENTAL + PYTHON WALL"
echo "=========================================="
echo

for tool in g++ pkg-config python; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "[ERROR] Missing tool: $tool"
        exit 1
    fi
done

if ! pkg-config --exists sdl3; then
    echo "[ERROR] SDL3 is not available to pkg-config."
    exit 1
fi

echo "[1/3] Canonical incremental direct-g++ build..."
python tools/incremental_build.py

echo
echo "[2/3] Python contract wall..."
mapfile -t PY_TESTS < <(find tests -maxdepth 1 -type f -name 'test_*.py' | sort)
for test_file in "${PY_TESTS[@]}"; do
    echo "  -> $test_file"
    python "$test_file"
done

echo
echo "[3/3] Frontier refit physical traversal proof..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_frontier_refit.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_frontier_refit_tests.exe
./build-direct/mongo_frontier_refit_tests.exe

echo
echo "CHECKPOINT BUILD PASS"
echo "Pure/static Python contract wall passed. Use BUILD_WINDOWS.bat for full C++ certification."
