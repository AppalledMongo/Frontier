#!/usr/bin/env bash
set -euo pipefail

echo "=========================================="
echo "MONGO ENGINE - BRICK 019.19.2"
echo "DEV BUILD // INCREMENTAL + SMOKE CONTRACTS"
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
    echo "Run BUILD_WINDOWS.bat once to verify/install the full toolchain."
    exit 1
fi

echo "[1/2] Canonical incremental direct-g++ build..."
python tools/incremental_build.py

echo
echo "[2/2] Fast subsystem smoke contracts..."
for test_file in \
    tests/test_019_19_2_frontier_refit_contract.py \
    tests/test_019_19_1_inventory_separation_contract.py \
    tests/test_019_19_persistent_infrastructure_contract.py \
    tests/test_019_18_2_consolidation_contract.py \
    tests/test_019_18_1_consolidation_contract.py \
    tests/test_living_world_foundation_contract.py \
    tests/test_hard_surface_graphics_engine_contract.py \
    tests/test_engine_visual_expansion_contract.py \
    tests/test_scavenger_android_visual_fidelity_contract.py \
    tests/test_frontier_renderer_contract.py \
    tests/test_renderer_shader_structure.py \
    tests/test_frontier_navigation_hud_contract.py \
    tests/test_negative_buoyancy_contract.py \
    tests/test_water_immersion_optics_contract.py \
    tests/test_ucrt64_runtime_chain_contract.py \
    tests/test_incremental_dependency_parser_contract.py; do
    echo "  -> $test_file"
    python "$test_file"
done

echo "  -> tests/test_orbital_infrastructure.cpp"
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_orbital_infrastructure.cpp \
    -o build-direct/mongo_orbital_infrastructure_tests.exe
./build-direct/mongo_orbital_infrastructure_tests.exe

echo "  -> tests/test_frontier_refit.cpp"
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_frontier_refit.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_frontier_refit_tests.exe
./build-direct/mongo_frontier_refit_tests.exe

echo
echo "DEV BUILD PASS"
echo "Incremental objects and the same runtime staging used by the full build are active."
