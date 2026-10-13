# Mongo Engine — Visual Roadmap Toward Concept-Art Quality

The concept art is a target for composition, lighting, material richness, atmospheric depth, and authored-looking procedural detail. It is not a promise that one brick will match a painted illustration. We reach it by stacking systems that reinforce one another while protecting the GTX 1070 performance target.

## Visual target decomposition

The target image succeeds because several layers work together:

1. **Sky / celestial drama** — dense stars, visible galactic structure, dawn color, illuminated cloud forms, giant ringed world.
2. **Atmospheric depth** — foreground is crisp, midground separates into layers, distant formations dissolve into haze/mist.
3. **Hero composition** — large cliffs/spires frame the scene instead of uniformly random props filling every direction.
4. **Water** — it mirrors the sky and sun, carries a bright reflection path, varies with viewing angle, and anchors the composition.
5. **Terrain materials** — rock, soil, wet shoreline, grass and mineral surfaces each react differently to light.
6. **Near-field richness** — boulders, plants, flowers, crystal fragments, wet patches and small debris create visual density around the camera.
7. **Landmark hierarchy** — a few large structures/spires dominate; medium formations support; small detail rewards inspection.
8. **Lighting** — warm directional dawn light + cool sky fill + emissive crystals + local practical lights.
9. **Player material/readability** — the robot receives rim light, grounded shadow, readable panels and emissive sensors.
10. **Interface restraint** — HUD frames the scene without covering it.

## Campaign plan

### Brick 019.10 — Dawn Vista Foundation
- Frontier inertial galactic band / Milky-Way-like structure.
- Layered procedural dawn clouds with real sun-direction illumination.
- Stronger horizon scattering and sunrise color separation.
- Water sky tint, Fresnel, dawn reflection path and night response.
- More near-field ground cover and small alien color accents.
- Far-vista low-cost skyline silhouettes outside the active gameplay detail ring.
- Keep current HUD/input/gameplay behavior intact.

### Brick 019.11 — Terrain Material System v2 — IMPLEMENTED
- World-space procedural/triplanar material coordinates.
- Distinct grassland, highland stone, pale sand, frost, wetland and mineral-scar responses.
- Roughness variation and stronger slope-driven exposed rock.
- Wetness band near water with darker albedo and tighter specular response.
- Macro geology + micro cavity/roughness breakup without texture-memory explosion.
- No new texture fetches or draw calls; live GTX 1070 profiling remains authoritative.

### Brick 019.12 — Water v2 / Aquatic Optics
- Better shallow/deep color from terrain depth.
- Multi-scale animated waves.
- Sky/sun/moon reflection approximation.
- Shore foam / wet edge.
- Underwater fog, waterline transition and aquatic optics.
- Crystal light scattering through water.

### Brick 019.14 — Procedural Flora & Ground Detail Kit
- Reusable low-poly alien plants, flower clusters, reeds, fungi, moss and ground tufts.
- Biome palettes and deterministic communities rather than uniform scatter.
- Near/mid LOD and batch/instance architecture.
- Rare emissive flora tied to anomaly/ecology.

### Brick 019.15 — Hero Landscape Grammar
- Crystal Basin.
- Broken Arch.
- Needle Valley.
- Fractured Mesa.
- Crater Lake.
- Ancient Battlefield.
- Machine Graveyard.
- Wreck Field.

Each grammar places one hero landmark, supporting mid-scale forms and a restrained near-field detail vocabulary. This replaces the feeling of random props with authored-looking composition.

### Brick 019.16 — Lighting / Materials / Player Readability
- Stronger sunrise/sunset rim lighting.
- Material-specific specular response.
- Better crystal transmission illusion.
- Robot metallic/paint separation and edge highlights.
- Local crystal/ruin light influence approximation.

### Brick 019.17 — Orbital Visual Parity
- Station material families.
- Refit bay machinery/detail kit v3.
- Window/glass response.
- Planet atmosphere/cloud material.
- Practical light pools, signage, service infrastructure and richer exterior silhouettes.

### Brick 019.18 — Performance / LOD Campaign
- GPU instancing for repeated flora/rocks where worthwhile.
- Distance LOD and culling.
- Cached procedural communities.
- Shadow complexity tiers.
- Draw-call/material grouping.
- Quality presets targeting GTX 1070 and newer hardware.


### Brick 019.18.1 — Ecotones + Logistics + Orbital Vessel — COMPLETE
- Replace binary biome edges with deterministic transition territory: dominant biome ownership plus a neighboring biome and bounded ecotone weight.
- Blend terrain material, vegetation communities and wildlife habitat through the same transition field.
- Moderately increase local terrain mesh density only where live footage proved visible faceting.
- Clean up stellar density/size hierarchy and atmospheric horizon extinction.
- Rebuild the Ancient Scavenger around dormant, corroded, intimidating machine archaeology and a readable wake sequence.
- Add physical blue-crystal cargo mass, staged encumbrance and Matter Ladder transfer into persistent orbital stock.
- Reframe the existing orbital interior as the command/caretaker deck inside a real ship and establish a first exterior hull whose volumes constrain future rooms.

**Rule:** Borders become ecosystems. Cargo has consequences. Orbit is a place, not a menu.


### Brick 019.18.2 — World Asset + HUD Consolidation — ACTIVE
- First real `I` inventory / cargo / salvage panel.
- Replace vague player telemetry with explicit machine **STRESS** and **ARMOR** language.
- Ancient Scavengers leave deterministic, persistent salvage wrecks with weighted intact-component recovery.
- Matter Ladder pass II: containment toroids, induction housings and stronger mechanical negative space.
- Ancient Scavenger pass II: restrained service-light anatomy plus dead-wreck presentation.
- Orbital Vessel inspection uses compound camera collision against major ship volumes.
- Scalable Fidelity profiles: EFFICIENT / BALANCED / HIGH / ULTRA; BALANCED preserves the GTX 1070-class beautiful baseline while stronger hardware buys distance, shadow quality and future entity/FX density.

**Rule:** Baseline-compatible, not baseline-limited. Simulation truth is shared; representation scales to the client.

### Brick 019.19 — Persistent Infrastructure Foundation — NEXT
- Orbital construction hexes / strategically meaningful build regions.
- Persistent Construction Core and station module graph.
- Declarative module vocabulary: mass, structure, power, heat, volume, cargo, hardpoints and material cost.
- Stock station geometry derived from what players actually build rather than selecting a station class.
- Matter Ladder / orbital stock feeds real construction costs.
- Foundation for server-authoritative components plus approved player texture/material packages.
- FAR / MID / NEAR representations so MMO infrastructure scales by client hardware without changing simulation truth.
- Preserve the larger Systemic Sandbox doctrine: future materials/capabilities and Intent Engine affordances grow out of the same component vocabulary.

**Rule:** Players design the architecture; physics and resources decide what it costs.

## Production rules

- **FAR = silhouette, celestial scale, atmosphere.**
- **MID = site/biome/structural composition.**
- **NEAR = inspection-quality detail.**
- Procedural generation must create *composition*, not uniform noise.
- Spend detail where the player stops and looks.
- Dark is a mood; featureless is a bug.
- Measure first, optimize second.
- Every beauty brick must preserve 60 Hz simulation and expose its performance cost.
- Windows SDL3/OpenGL live playtest remains final authority.

### Brick 019.11.1 — Terrain Material Naturalization — IMPLEMENTED

Live-test correction pass for Terrain Material System v2. Removes visible square/cell breakup through continuous noise and domain warping, reduces high-frequency albedo contrast, turns Mineral Scar sparkle into broader geological veins, softens micro AO/roughness noise, and makes shoreline wetness irregular but less mirror-like.

**Rule:** Kill the grid. Kill the glitter. Keep the geology.

### Brick 019.11.2 — Terrain Material Ownership — IMPLEMENTED

Live-video correction pass after 019.11.1. Strong climate/slope/anomaly coloration is removed from the sparse 16x16 terrain vertices so triangle interpolation can no longer become giant visible albedo facets. The fragment material now owns the dominant biome palette and continuous climate/geology response.

Fine procedural normal, roughness and micro-albedo response is derivative-filtered with `dFdx`/`dFdy`, fading toward neutral as its screen-space footprint becomes sub-pixel. The geometry mesh remains unchanged until profiling proves additional tessellation is necessary.

**Rule:** Kill the grid. Kill the glitter. Kill the triangles. Keep the geology.


### Brick 019.12 — Water / Aquatic Optics — IMPLEMENTED
Depth-aware cached water mesh, Fresnel sky response, shallow/deep optical color, restrained shoreline foam, world-anchored waves and distance-filtered capillary detail.

## 019.12.1 — Shoreline + Immersion Optics
Live-test refinement after Water/Aquatic Optics: preserve the celestial vista
while making swimming feel physically embedded in water. Near-surface optics,
biome-aware extinction/scatter, readable night water and softer shoreline
integration complete the first aquatic presentation layer before atmospheric
depth work resumes.


## Brick 019.13 — Planetary Traversal + Verticality — IMPLEMENTED

019.13 inserts a landform/traversal foundation before the flora campaign. The
planet now produces strong continental/regional relief, ridged mountain chains,
escarpments, connected valleys, basins and mesas. The arrival area gains a
nearby deep watershed with beach/shelf/basin structure and a persistent crashed
escape-pod site.

Traversal is now configuration-aware: Light Expedition Legs cap at 38 degrees,
Treads at 42 degrees and Spider Legs at 60 degrees. Deep-water pressure limits
are soft machine gates rather than instant-death walls; the canonical warning
is `PRESSURE TOO GREAT FOR CURRENT CONFIGURATION`.

**Rule:** Capability meets geography. Generate inaccessible places now so later
robot configurations genuinely reopen the same persistent world.

## Brick 019.13.2 — geography stabilization

Before adding more atmosphere or geometry, the dramatic landform pass must be
camera-safe and measurable. 019.13.2 therefore adds terrain-aware camera
authority, erosion structure that preserves large elevation, and profiler
buckets fine enough to identify the real CPU cost. Deterministic surface decor
is cached instead of regenerated every frame.

Visual rule: **keep the mountains; make their geology believable; make the
camera respect them; measure before spending more.**

## Brick 019.14 — Atmospheric Depth + Hero Landscape Pass

019.14 spends the new 019.13 verticality on composition instead of adding more
raw geometry. Analytic valley haze, mid-distance layering and distant-ridge
aerial perspective create foreground/midground/background separation without a
new render pass. Terrain materials gain continuous visual ecotones: steep faces
share geological substrate and elevation frost feathers across ridges rather
than following hard biome wedges. Synthetic far-vista hero forms are less
frequent and receive geological roots so the real mountains own the skyline.

## Brick 019.15 — Alien Ecology + Machine Navigation

- Replace evenly sprinkled, saturated procedural flora with deterministic
  geography-aware communities.
- Favor low mats, reeds, scrub, crusts and restrained fungal forms; reserve tall
  saturated forms for rare accents.
- Use real shore height/moisture to break the hard land/water boundary.
- Preserve the cached one-batch decor architecture.
- Correct the compass so cardinal labels scroll against an authoritative
  NORTH=-Z / EAST=+X convention.
- Use the same convention for environmental sensor bearings, beginning with the
  crashed starter escape pod.
- Treat baseline Frontier robots as negatively buoyant bottom walkers; aquatic
  freedom is a future machine-configuration capability.

## Brick 019.16 — Scavenger Android + Visual Fidelity — ACTIVE

Unit 001 becomes a gritty crash-landed scavenger android: Fallout-style wear,
BattleTech/MechWarrior functional machinery, Gundam-level silhouette clarity,
and visible modular/tool interfaces that support future Intent Engine emergent
fabrication. The same persistent machine remains authoritative.

The visual pass also restrains bloom/grade softness and improves contact/readability
without changing gameplay ownership.

### Development pipeline stabilization
019.16 also standardizes one direct-g++ build path across DEV and FULL modes.
Incremental object/dependency caching speeds visual iteration; checkpoint mode
runs the Python contract wall; full certification retains the native regression
wall and writes a last-known-green snapshot.


## Brick 019.16.3 — Unit 001 All-Angle Model Pass

Unit 001 now uses a substantially richer native procedural hard-surface model: layered armor, exposed actuator rails, asymmetric tool/manipulator arms, rear power/tank detail, cable runs, cloth/shroud fragments, an orange scanning monocular with blue auxiliary optic and red rangefinder emitters, intermittent short scan instrumentation, and a geometry-built forgotten-company insignia. The model is intentionally detailed from front, side, and rear while staying on the existing batched primitive/material path.

## Brick 019.16.4 — Mechanical Anatomy / Negative Space
Unit 001 modeling pass two targets the live renderer directly: articulated skeleton, tapered body mass, all-angle negative space, gimbal-mounted scanner head, rear survival machinery and mechanically plausible joints before any further decal/detail expansion.


## Brick 019.16.6 — Macro Silhouette Pass IV

Unit 001 receives a third live-engine fidelity pass focused on functional micro-detail and all-angle readability. The model keeps the 019.16.4 mechanical skeleton and adds layered armor edges, service vents, fasteners, rib plates, hip hardware, leg guards, foot cleats, shoulder caps, richer tool/manipulator anatomy, rear survival-rig details, head sensor rails, and sparse maintenance lighting. No concept-only substitute: this is procedural renderer geometry.

## Brick 019.17 — Engine Visual Expansion

This brick changes the renderer's vocabulary instead of continuing to decorate the same box/sphere model set. Mongo Engine now owns a GPU-instanced cylinder primitive for tanks, pistons, bearings, pipes, lens barrels, hydraulic struts, machinery, station equipment, vehicles and future mech frames. Unit 001 immediately consumes that capability for continuous cable runs, cylindrical structural members, rear tanks, joint caps and recessed optics.

The celestial path also moves to a second-generation presentation layer: seeded stellar clusters persist across planets in the same star system, orbital nebulae gain bright ionized filaments and narrow dust lanes, selected high-latitude worlds gain subtle seeded auroral curtains, and sibling planets reconstruct real sphere normals so their lighting follows the system sun. Ringed bodies gain richer radial grooves, front/back ring ordering, atmospheric limb light and a ring shadow crossing the planetary face.

Performance rule remains the same: prefer analytic shader detail and instanced reusable geometry over expensive extra passes. This is foundation work for the next stages: richer Unit 001 hard-surface anatomy, higher-quality escape-pod/wreckage assets, station machinery, procedural ruins, more cinematic orbital views, and increasingly distinct alien worlds.


## Brick 019.17.1 — Hard-Surface Graphics Engine

Teach the renderer a reusable machinery vocabulary before spending more geometry on individual assets: beveled housings, tapered armor/frustums, mechanical rings/bearings, cylinders and routed pipes. Unit 001 is the first proving ground, but the same vocabulary is intended for wreckage, stations, vehicles, ruins and later heavy frames.

Night celestial authority is tightened in the same brick: the planet horizon occludes the direct solar disc/halo and solar scattering is limited to real twilight so astronomical night becomes genuinely dark while preserving dawn/sunset atmosphere.


### Brick 019.19 — Persistent Infrastructure Foundation — ACTIVE

- Seven stable Pelagos orbital construction sites use axial-hex identity.
- `B` opens the exterior orbital construction planner; `[`/`]` select sites, `WASD` moves the build cursor, `C` places a Construction Core, `1..8` install official engineering modules, `R` rotates, and `X` removes without allowing graph-severing deconstruction.
- Built stations are persistent component graphs whose visible shape is generated from the same authoritative module state that produces mass, structure, power, thermal, cargo and hardpoint totals.
- Construction consumes real Matter-Ladder-delivered orbital crystal stock.
- The current exterior station placement is a presentation-scale projection; stable site/module identity is deliberately independent from local render coordinates in preparation for the large-world reference-frame layer.
- Visual rule remains **GTX-1070 beautiful baseline, not ceiling**: module geometry is deliberately macro/mid-scale and reuses existing primitive vocabulary rather than creating a draw-call-heavy asset path.
