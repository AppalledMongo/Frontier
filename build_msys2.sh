#!/usr/bin/env bash
set -euo pipefail

echo "=========================================="
echo "MONGO ENGINE - BRICK 019.19.2"
echo "FRONTIER UNIT REFIT FOUNDATION"
echo "DIRECT MSYS2 UCRT64 BUILD"
echo "=========================================="
echo

echo "[1/132] Checking toolchain..."
for tool in gcc g++ pkg-config pacman python; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "[ERROR] Missing tool: $tool"
        exit 1
    fi
done

echo "  gcc: $(gcc --version | head -n1)"
echo "  g++: $(g++ --version | head -n1)"
echo

echo "[2/132] Ensuring SDL3 is installed..."
if ! pacman -Q mingw-w64-ucrt-x86_64-sdl3 >/dev/null 2>&1; then
    pacman -S --needed --noconfirm mingw-w64-ucrt-x86_64-sdl3
fi
echo "  SDL3: $(pkg-config --modversion sdl3)"
echo

mkdir -p build-direct

echo "[3/132] Core timing tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_fixed_step.cpp \
    -o build-direct/mongo_core_tests.exe
./build-direct/mongo_core_tests.exe

echo
echo "[4/132] Math tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_math.cpp \
    -o build-direct/mongo_math_tests.exe
./build-direct/mongo_math_tests.exe

echo
echo "[5/132] Camera tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_camera.cpp engine/world/Camera2D.cpp \
    -o build-direct/mongo_camera_tests.exe
./build-direct/mongo_camera_tests.exe

echo
echo "[6/132] Entity registry tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_entity.cpp engine/entity/Registry.cpp \
    -o build-direct/mongo_entity_tests.exe
./build-direct/mongo_entity_tests.exe

echo
echo "[7/132] World/entity tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_world_entities.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_world_entity_tests.exe
./build-direct/mongo_world_entity_tests.exe

echo
echo "[8/132] Asset loader tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_assets.cpp \
    engine/assets/PpmLoader.cpp \
    -o build-direct/mongo_asset_tests.exe
./build-direct/mongo_asset_tests.exe

echo
echo "[9/132] Sprite component tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_sprite_components.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_sprite_tests.exe
./build-direct/mongo_sprite_tests.exe

echo
echo "[10/132] Bitmap font tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_bitmap_font.cpp \
    engine/debug/BitmapFont.cpp \
    -o build-direct/mongo_bitmap_font_tests.exe
./build-direct/mongo_bitmap_font_tests.exe

echo
echo "[11/132] Debug telemetry tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_debug_data.cpp \
    -o build-direct/mongo_debug_data_tests.exe
./build-direct/mongo_debug_data_tests.exe

echo
echo "[12/132] Visual foundation tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_visual_foundation.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_visual_tests.exe
./build-direct/mongo_visual_tests.exe

echo
echo "[13/132] HUD layout tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_hud_layout.cpp \
    -o build-direct/mongo_hud_layout_tests.exe
./build-direct/mongo_hud_layout_tests.exe

echo
echo "[14/132] AI robot identity tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_ai_robot_identity.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_ai_robot_tests.exe
./build-direct/mongo_ai_robot_tests.exe

echo
echo "[15/132] Texture UV orientation tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_texture_uv_orientation.cpp \
    -o build-direct/mongo_texture_uv_tests.exe
./build-direct/mongo_texture_uv_tests.exe

echo
echo "[16/132] Lighting FX tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_lighting_fx.cpp \
    -o build-direct/mongo_lighting_fx_tests.exe
./build-direct/mongo_lighting_fx_tests.exe

echo
echo "[17/132] Renderer alpha contract check..."
python tests/test_renderer_alpha_contract.py

echo
echo "[18/132] Lighting polish tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_lighting_polish.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_lighting_polish_tests.exe
./build-direct/mongo_lighting_polish_tests.exe

echo
echo "[19/132] Orbital station scene tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_orbital_scene.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_orbital_scene_tests.exe
./build-direct/mongo_orbital_scene_tests.exe

echo
echo "[20/132] Radial shader contract check..."
python tests/test_radial_shader_contract.py

echo
echo "[21/132] Observation glass collision tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_observation_glass.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_observation_glass_tests.exe
./build-direct/mongo_observation_glass_tests.exe

echo
echo
echo "[22/132] Bulkhead door + room-flow tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_bulkhead_doors.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_bulkhead_tests.exe
./build-direct/mongo_bulkhead_tests.exe

echo
echo
echo "[23/132] Living bulkhead interaction tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_living_bulkheads.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_living_bulkhead_tests.exe
./build-direct/mongo_living_bulkhead_tests.exe

echo
echo
echo "[24/132] Door alert-decay regression tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_door_alert_decay.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_door_alert_tests.exe
./build-direct/mongo_door_alert_tests.exe

echo
echo
echo "[25/132] Generic interaction tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_generic_interaction.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_generic_interaction_tests.exe
./build-direct/mongo_generic_interaction_tests.exe

echo
echo "[26/132] Interaction contract check..."
python tests/test_interaction_contract.py

echo
echo
echo "[27/132] Bulkhead safety-interlock tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_bulkhead_safety_interlock.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_bulkhead_safety_tests.exe
./build-direct/mongo_bulkhead_safety_tests.exe

echo
echo
echo "[28/132] Sealed bulkhead collision regression tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_sealed_bulkhead_collision.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    -o build-direct/mongo_sealed_bulkhead_tests.exe
./build-direct/mongo_sealed_bulkhead_tests.exe

echo
echo
echo "[29/132] Intent translation tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_intent_engine.cpp \
    engine/intent/IntentEngine.cpp \
    engine/intent/StatMatrix.cpp \
    -o build-direct/mongo_intent_engine_tests.exe
./build-direct/mongo_intent_engine_tests.exe

echo
echo "[30/132] Intent ledger tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_intent_ledger.cpp \
    engine/intent/IntentEngine.cpp \
    engine/intent/StatMatrix.cpp \
    engine/intent/IntentLedger.cpp \
    -o build-direct/mongo_intent_ledger_tests.exe
./build-direct/mongo_intent_ledger_tests.exe

echo
echo "[31/132] Intent input contract check..."
python tests/test_intent_input_contract.py

echo
echo
echo "[32/132] Intent visibility data tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_intent_visibility.cpp \
    -o build-direct/mongo_intent_visibility_tests.exe
./build-direct/mongo_intent_visibility_tests.exe

echo
echo "[33/132] Intent visibility contract check..."
python tests/test_intent_visibility_contract.py

echo
echo
echo "[34/132] Semantic stat-matrix tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_semantic_stat_matrix.cpp \
    engine/intent/IntentEngine.cpp \
    engine/intent/StatMatrix.cpp \
    -o build-direct/mongo_semantic_stat_tests.exe
./build-direct/mongo_semantic_stat_tests.exe

echo
echo "[35/132] Modifier lexicon tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_modifier_lexicon.cpp \
    engine/intent/IntentEngine.cpp \
    engine/intent/StatMatrix.cpp \
    -o build-direct/mongo_modifier_lexicon_tests.exe
./build-direct/mongo_modifier_lexicon_tests.exe

echo
echo "[36/132] Stat-matrix contract check..."
python tests/test_stat_matrix_contract.py

echo
echo
echo "[37/132] Contextual intent resolution tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_contextual_intent_resolution.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    engine/intent/IntentEngine.cpp \
    engine/intent/StatMatrix.cpp \
    engine/intent/ContextResolver.cpp \
    -o build-direct/mongo_contextual_intent_tests.exe
./build-direct/mongo_contextual_intent_tests.exe

echo
echo "[38/132] Native intent visibility tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_native_intent_visibility.cpp \
    -o build-direct/mongo_native_intent_visibility_tests.exe
./build-direct/mongo_native_intent_visibility_tests.exe

echo
echo "[39/132] Contextual intent contract check..."
python tests/test_contextual_intent_contract.py

echo
echo
echo "[40/132] Narrative response tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_narrative_response.cpp \
    engine/entity/Registry.cpp \
    engine/world/World.cpp \
    engine/intent/IntentEngine.cpp \
    engine/intent/StatMatrix.cpp \
    engine/intent/ContextResolver.cpp \
    -o build-direct/mongo_narrative_response_tests.exe
./build-direct/mongo_narrative_response_tests.exe

echo
echo "[41/132] Narrative visibility tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_narrative_visibility.cpp \
    -o build-direct/mongo_narrative_visibility_tests.exe
./build-direct/mongo_narrative_visibility_tests.exe

echo
echo "[42/132] Narrative input contract check..."
python tests/test_narrative_input_contract.py

echo
echo
echo "[43/132] Frontier 3D math tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_frontier_math3d.cpp \
    engine/world/Camera3D.cpp \
    -o build-direct/mongo_frontier_math3d_tests.exe
./build-direct/mongo_frontier_math3d_tests.exe

echo
echo "[44/132] Frontier huge-world tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_frontier_world.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_frontier_world_tests.exe
./build-direct/mongo_frontier_world_tests.exe

echo
echo "[45/132] Frontier renderer contract check..."
python tests/test_frontier_renderer_contract.py

echo
echo "[46/132] Frontier integration contract check..."
python tests/test_frontier_integration_contract.py

echo
echo
echo "[47/132] Procedural planetscape tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_planetscape.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_planetscape_tests.exe
./build-direct/mongo_planetscape_tests.exe

echo
echo "[48/132] Planetscape renderer contract check..."
python tests/test_planetscape_renderer_contract.py

echo
echo
echo "[49/132] Planet atmosphere world tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_planet_atmosphere.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_planet_atmosphere_tests.exe
./build-direct/mongo_planet_atmosphere_tests.exe

echo
echo "[50/132] Frontier orbit-camera tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_frontier_orbit_camera.cpp \
    engine/world/Camera3D.cpp \
    -o build-direct/mongo_frontier_orbit_camera_tests.exe
./build-direct/mongo_frontier_orbit_camera_tests.exe

echo
echo "[51/132] Atmosphere renderer contract check..."
python tests/test_atmosphere_renderer_contract.py

echo
echo "[52/132] Frontier camera-controls contract check..."
python tests/test_frontier_camera_controls_contract.py

echo
echo
echo "[53/132] Character skill progression tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_skill_progression.cpp \
    engine/progression/SkillProgression.cpp \
    -o build-direct/mongo_skill_progression_tests.exe
./build-direct/mongo_skill_progression_tests.exe

echo
echo "[54/132] Water traversal tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_water_traversal.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_water_traversal_tests.exe
./build-direct/mongo_water_traversal_tests.exe

echo
echo "[55/132] World-anchored celestial contract check..."
python tests/test_world_anchored_celestials_contract.py

echo
echo "[56/132] Skill integration contract check..."
python tests/test_skill_integration_contract.py

echo
echo
echo "[57/132] Frontier training-intent tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_frontier_training_intent.cpp \
    engine/intent/IntentEngine.cpp \
    engine/intent/StatMatrix.cpp \
    engine/intent/FrontierIntentResolver.cpp \
    engine/progression/SkillProgression.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_frontier_training_intent_tests.exe
./build-direct/mongo_frontier_training_intent_tests.exe

echo
echo "[58/132] Frontier intent-training contract check..."
python tests/test_frontier_intent_training_contract.py

echo
echo
echo "[59/132] Semantic + sky polish contract check..."
python tests/test_semantic_sky_polish_contract.py

echo
echo
echo "[60/132] Persistent character service tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_character_persistence.cpp \
    engine/persistence/LocalCharacterRepository.cpp \
    engine/persistence/CharacterService.cpp \
    engine/progression/SkillProgression.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_character_persistence_tests.exe
./build-direct/mongo_character_persistence_tests.exe

echo
echo "[61/132] MMO-ready persistence contract check..."
python tests/test_mmo_persistence_contract.py

echo
echo
echo "[62/132] Frontier surface-polish contract check..."
python tests/test_frontier_surface_polish_contract.py

echo
echo
echo "[63/132] Frontier HUD + hero + prop identity contract check..."
python tests/test_frontier_visual_identity_contract.py

echo
echo
echo "[64/132] Orbital station 3D world tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_orbital_station_world.cpp \
    engine/world/OrbitalStationWorld.cpp \
    -o build-direct/mongo_orbital_station_world_tests.exe
./build-direct/mongo_orbital_station_world_tests.exe

echo
echo "[65/132] Dual 3D gameplay architecture contract..."
python tests/test_dual_3d_gameplay_contract.py

echo
echo "[66/132] Persistent dual-entity character regression..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_character_persistence.cpp \
    engine/persistence/LocalCharacterRepository.cpp \
    engine/persistence/CharacterService.cpp \
    engine/progression/SkillProgression.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_dual_entity_persistence_tests.exe
./build-direct/mongo_dual_entity_persistence_tests.exe

echo
echo
echo "[67/132] Character + station modeling polish contract..."
python tests/test_modeling_polish_contract.py

echo
echo "[68/132] Full visual contract sweep..."
python tests/test_frontier_visual_identity_contract.py
python tests/test_frontier_surface_polish_contract.py
python tests/test_dual_3d_gameplay_contract.py
python tests/test_frontier_camera_controls_contract.py

echo
echo
echo "[69/132] Presentation + motion architecture contract..."
python tests/test_presentation_motion_contract.py

echo
echo
echo "[70/132] Orbital density + refit presentation contract..."
python tests/test_orbital_density_refit_contract.py

echo
echo
echo "[71/132] Crystal resource loop simulation tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_crystal_resource_loop.cpp \
    engine/intent/FrontierIntentResolver.cpp \
    engine/intent/IntentEngine.cpp \
    engine/intent/StatMatrix.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_crystal_resource_tests.exe
./build-direct/mongo_crystal_resource_tests.exe

echo
echo "[72/132] Crystal resource architecture contract..."
python tests/test_crystal_resource_contract.py

echo
echo
echo "[73/132] Core Flux pseudo-science gameplay tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_core_flux.cpp \
    engine/gameplay/CoreFlux.cpp \
    -o build-direct/mongo_core_flux_tests.exe
./build-direct/mongo_core_flux_tests.exe

echo
echo "[74/132] Crystal ecology + first threat simulation tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_frontier_crystal_threats.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_crystal_threat_tests.exe
./build-direct/mongo_crystal_threat_tests.exe

echo
echo "[75/132] Crystal hazard architecture contract..."
python tests/test_crystal_resource_contract.py

echo
echo
echo "[76/132] Frontier beauty + presentation contract..."
python tests/test_frontier_beauty_contract.py

echo
echo "[77/132] Save telemetry + checkpoint contract..."
python tests/test_save_status_contract.py

echo
echo "[78/132] Procedural presentation architecture contract..."
python tests/test_procedural_presentation_contract.py

echo
echo "[79/132] Renderer foundation contract..."
python tests/test_renderer_foundation_contract.py

echo
echo "[80/132] Renderer shader-structure smoke test..."
python tests/test_renderer_shader_structure.py

echo
echo "[81/132] HDR calibration + shadow budget contract..."
python tests/test_hdr_calibration_contract.py

echo
echo "[82/132] Orbital 360-degree procedural cosmic-sky contract..."
python tests/test_orbital_cosmic_sky_contract.py

echo
echo "[83/132] Persistent alien-landmark LOD contract..."
python tests/test_landmark_persistence_contract.py

echo
echo "[84/132] Frontier hero-landscape composition contract..."
python tests/test_hero_landscape_contract.py

echo
echo "[85/132] Orbital station industrial-detail contract..."
python tests/test_station_industrial_detail_contract.py

echo
echo "[86/132] Hero-site art contract..."
python tests/test_hero_site_art_contract.py

echo
echo "[87/132] Frontier performance-budget contract..."
python tests/test_frontier_performance_budget_contract.py

echo
echo "[88/132] Station material + lighting contract..."
python tests/test_station_material_lighting_contract.py

echo
echo "[89/132] Frontier GPU primitive-instancing contract..."
python tests/test_frontier_instancing_contract.py

echo
echo "[90/132] Near-landmark fractured-art contract..."
python tests/test_near_landmark_art_contract.py

echo
echo "[91/132] Development/release boot-workflow contract..."
python tests/test_dev_release_workflow_contract.py

echo
echo "[92/132] Frontier static-site cache contract..."
python tests/test_frontier_static_site_cache_contract.py

echo
echo "[93/132] Frontier render-telemetry contract..."
python tests/test_frontier_render_telemetry_contract.py

echo
echo "[94/132] Release boot architecture lock contract..."
python tests/test_release_boot_lock_contract.py

echo
echo "[95/132] Cinematic material pipeline contract..."
python tests/test_cinematic_material_pipeline_contract.py

echo
echo "[96/132] Cinematic atmosphere + grade contract..."
python tests/test_cinematic_atmosphere_grade_contract.py

echo
echo "[97/132] Planetary celestial simulation tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_celestial_system.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_celestial_system_tests.exe
./build-direct/mongo_celestial_system_tests.exe

echo
echo "[98/132] Planetary celestial renderer/architecture contract..."
python tests/test_planetary_celestial_contract.py

echo
echo "[99/132] Planet surface material-system contract..."
python tests/test_surface_material_system_contract.py

echo
echo "[100/132] Twilight + night readability contract..."
python tests/test_twilight_night_contract.py

echo
echo "[101/132] Night surface + atmosphere contract..."
python tests/test_night_surface_atmosphere_contract.py

echo
echo "[102/132] Mongo Labs HUD v2 contract..."
python tests/test_hud_v2_contract.py

echo
echo "[103/132] Frontier first-person optics contract..."
python tests/test_frontier_first_person_contract.py

echo
echo "[104/132] Frontier optics mouse-capture + intent-focus contract..."
python tests/test_frontier_optics_input_contract.py

echo
echo "[105/132] Orbital Station Beauty v2 contract..."
python tests/test_orbital_beauty_v2_contract.py

echo
echo "[106/132] Mongo Labs HUD cohesion contract..."
python tests/test_hud_cohesion_contract.py

echo
echo "[107/132] Player HUD containment contract..."
python tests/test_hud_containment_contract.py

echo
echo "[108/132] HUD finish / width-safety contract..."
python tests/test_hud_finish_contract.py

echo
echo "[109/132] Dawn vista / concept-art direction contract..."
python tests/test_dawn_vista_contract.py

echo "[110/132] Terrain Material System v2 contract..."
python tests/test_terrain_material_v2_contract.py

echo
echo "[111/132] Terrain Material Naturalization contract..."
python tests/test_terrain_material_naturalization_contract.py

echo
echo "[112/132] Terrain Material Ownership contract..."
python tests/test_terrain_material_ownership_contract.py

echo
echo "[113/132] Water / Aquatic Optics contract..."
python tests/test_water_aquatic_optics_contract.py

echo
echo "[114/132] Shoreline + Immersion Optics contract..."
python tests/test_water_immersion_optics_contract.py

echo
echo "[115/132] Planetary traversal + verticality C++ tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_planetary_traversal_verticality.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_planetary_traversal_verticality_tests.exe
./build-direct/mongo_planetary_traversal_verticality_tests.exe

echo
echo "[116/132] Planetary traversal + verticality renderer contract..."
python tests/test_planetary_traversal_verticality_contract.py

echo
echo
echo "[117/132] Traversal authority + Frontier refit live-gate tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_traversal_authority.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_traversal_authority_tests.exe
./build-direct/mongo_traversal_authority_tests.exe
python tests/test_traversal_authority_contract.py

g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_frontier_refit.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    -o build-direct/mongo_frontier_refit_tests.exe
./build-direct/mongo_frontier_refit_tests.exe
python tests/test_019_19_2_frontier_refit_contract.py

echo
echo "[118/132] Terrain camera authority C++ tests..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_terrain_camera_authority.cpp \
    engine/world/FrontierWorld.cpp \
    engine/world/CelestialSystem.cpp \
    engine/world/Camera3D.cpp \
    -o build-direct/mongo_terrain_camera_authority_tests.exe
./build-direct/mongo_terrain_camera_authority_tests.exe

echo
echo "[119/132] Terrain camera + performance authority contract..."
python tests/test_terrain_camera_performance_contract.py

echo
echo "[120/132] Atmospheric Depth + Hero Landscape contract..."
python tests/test_atmospheric_depth_hero_landscape_contract.py

echo
echo "[121/132] Frontier navigation + compass authority..."
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_frontier_navigation.cpp \
    -o build-direct/mongo_frontier_navigation_tests.exe
./build-direct/mongo_frontier_navigation_tests.exe
python tests/test_frontier_navigation_hud_contract.py

echo
echo "[122/132] Negative buoyancy + human-readable capability alerts..."
python tests/test_negative_buoyancy_contract.py

echo
echo "[123/132] Alien ecology + shoreline ground-dressing contract..."
python tests/test_alien_ecology_contract.py

echo
echo "[124/132] Scavenger Android + Visual Fidelity contract..."
python tests/test_scavenger_android_visual_fidelity_contract.py

echo
echo "[125/132] Development build pipeline + dependency-parser contract..."
python tests/test_development_build_pipeline_contract.py
python tests/test_incremental_dependency_parser_contract.py

echo
echo "[126/132] Engine visual-expansion contract..."
python tests/test_engine_visual_expansion_contract.py

echo
echo "[127/132] Living-world + hard-surface graphics authority contracts..."
python tests/test_living_world_foundation_contract.py
python tests/test_hard_surface_graphics_engine_contract.py

echo
echo "[128/132] 019.18.1 world/logistics/vessel consolidation regression..."
python tests/test_019_18_1_consolidation_contract.py
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_cargo_logistics.cpp \
    -o build-direct/mongo_cargo_logistics_tests.exe
./build-direct/mongo_cargo_logistics_tests.exe

echo
echo "[129/132] 019.18.2 inventory / salvage / scalable-fidelity regression..."
python tests/test_019_18_2_consolidation_contract.py
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_ancient_salvage.cpp \
    -o build-direct/mongo_ancient_salvage_tests.exe
./build-direct/mongo_ancient_salvage_tests.exe
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_scalable_fidelity.cpp \
    -o build-direct/mongo_scalable_fidelity_tests.exe
./build-direct/mongo_scalable_fidelity_tests.exe


echo
echo "[130/132] 019.19 persistent orbital-infrastructure regression..."
python tests/test_019_19_persistent_infrastructure_contract.py
g++ -std=c++20 -Wall -Wextra -Wpedantic -I. \
    tests/test_orbital_infrastructure.cpp \
    -o build-direct/mongo_orbital_infrastructure_tests.exe
./build-direct/mongo_orbital_infrastructure_tests.exe

echo
echo "[131/132] Canonical clean direct-g++ game build..."
python tools/incremental_build.py --clean --certify

echo
echo "[132/132] Runtime + last-known-green snapshot prepared..."
echo "  Runtime: build-direct/mongo_game.exe"
echo "  Certified: build-certified/mongo_game.exe"
echo "  Working directory: project root"

echo
echo "=========================================="
echo "MONGO ENGINE BRICK 019.19: BUILD PASS"
echo "=========================================="
echo
echo "F1 = Frontier HUD cycle PLAYER / DEBUG / OFF (station HUD toggle)"
echo "F2 = toggle collider outlines"
echo "F3 = toggle station lighting / visual FX"
echo "F6 = cycle presentation fidelity EFFICIENT / BALANCED / HIGH / ULTRA"
echo "V  = Frontier external camera / first-person optical array"
echo "F4 = transfer station / Frontier control"
echo "I  = Frontier inventory / salvage cargo"
echo "RMB drag = external/orbital camera look"
echo "FIRST PERSON = captured mouse free-look; cursor hidden"
echo "Mouse wheel = zoom frontier camera"
echo "Baseline Frontier chassis = negative buoyancy; deep water uses bottom transit until pressure limit"
echo "Buoyancy / ballast / aquatic propulsion = future configuration capabilities"
echo "Character progression = autosaved to stable Mongo Labs app-data storage"
echo "019.11.1 = Terrain Naturalization: warped geology, continuous micro detail, restrained wet/mineral sparkle"
echo "019.11.2 = Terrain Material Ownership: neutral vertices, fragment biome palette, distance-filtered micro detail"
echo "019.12 = Water / Aquatic Optics: cached depth mesh, Fresnel sky response, shoreline fade, distance-filtered ripples"
echo "019.12.1 = Shoreline + Immersion Optics: near-water optics, volumetric extinction, readable night water"
echo "019.13 = Planetary Traversal + Verticality: dramatic landforms, deep watershed, capability gates, escape-pod beach wreck"
echo "019.13.1 = Traversal Authority: directional slope refusal, player warnings, bottom/submersion pressure telemetry"
echo "019.13.2 = Terrain Camera + Performance Authority: terrain-safe cameras, cached decor, profiler buckets, erosion naturalization"
echo "019.14 = Atmospheric Depth + Hero Landscape: valley haze, layered ridges, visual ecotones, rooted far vistas"
echo "019.15 = Ecology + Navigation: clustered biome ecology, shoreline growth, corrected compass, pod sensor return, negative buoyancy"
echo "019.16 = Scavenger Android + Visual Fidelity: crash-survivor silhouette, worn armor, asymmetric salvage, restrained bloom"
echo "E  = interact with nearby environment"
echo "ENTER = free-form intent prompt in station OR Frontier 3D"
echo "WASD / Arrow Keys = move"
echo "ESC = quit"
echo
./build-direct/mongo_game.exe
