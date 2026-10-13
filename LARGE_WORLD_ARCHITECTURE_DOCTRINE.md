# Mongo Engine Large-World Architecture Doctrine

## Goal

Mongo Engine must eventually support seamless transitions from local on-foot scale to ships, orbital infrastructure, planets and interplanetary space without sacrificing the GTX-1070-class **beautiful baseline**. Precision, simulation authority and visual fidelity are separate engineering concerns.

## Rule 1 — Hybrid precision, not "double everything"

Authoritative/global positions use 64-bit precision (or a cell/sector + local-offset representation). Local gameplay physics and GPU rendering remain near a local origin and may use 32-bit floats where they are faster and sufficiently precise.

Never send astronomical absolute coordinates directly through ordinary float render transforms. Convert global positions to a camera/reference-frame-relative local position at one deliberate boundary.

Recommended conceptual types:

- `GlobalPosition`: double-precision or sector/cell + double offset.
- `ReferenceFrameId`: star system / planet / orbital zone / vessel / interior / surface region.
- `LocalPosition`: float position close to the active reference-frame origin.
- `RenderPosition`: camera-relative float produced immediately before render submission.

The conversion point must be explicit and auditable.

## Rule 2 — Reference spaces are first-class objects

The universe is hierarchical rather than one gigantic Cartesian box:

`Universe -> Star System -> Planet/Moon -> Orbital Zone -> Vessel/Station -> Interior -> Surface Patch`

Objects retain a stable global identity while being simulated in the smallest useful local frame. Moving interiors should be local physics spaces attached to their vessel, not thousands of loose world-space objects translated through astronomical coordinates every frame.

Frame transitions must preserve position, orientation and velocity and must use hysteresis so an entity near a boundary cannot oscillate between frames every tick.

## Rule 3 — Camera-relative rendering

Rendering works relative to the active camera/reference origin. Large-world CPU state can remain high precision, but shaders should receive small local values wherever possible.

Do not require consumer GPUs to perform pervasive fp64 shader math. High precision on the GPU is expensive and inconsistent across consumer hardware.

## Rule 4 — Local physics bubbles, persistent remote simulation

Only nearby interactive objects require full rigid-body physics. Distant orbital bodies, ships and infrastructure use cheaper authoritative state/orbital propagation until they enter an interaction bubble.

The simulation layer may know that thousands of objects exist while a client renders and physically resolves only the locally relevant subset.

Fixed-step simulation remains authoritative. Rendering interpolates presentation independently.

## Rule 5 — Planet surfaces use hierarchical LOD and bounded streaming

Future spherical planets should use a cube-sphere/quadtree or equivalent hierarchical surface representation driven by screen-space error.

Terrain geometry, textures, vegetation and decals receive explicit working-set budgets. Load/generate the nearest and most visually important tiles first. Do not let "maximum quality" mean unbounded generation work in a single frame.

Near terrain remains crisp while distant detail scales according to hardware profile and display resolution.

## Rule 6 — Seamless transitions are data transitions, not giant always-live scenes

"No loading screen" must not mean "keep the entire planet and solar system resident." Assets and simulation state stream between representations while continuity is maintained.

Atmosphere/flight regimes should blend using physically meaningful fields such as atmospheric density, gravity and altitude, with hysteresis around thresholds. Avoid brittle one-frame mode switches such as SPACE -> ATMOSPHERE -> SURFACE.

## Rule 7 — Procedural generation creates foundation; authored rules create identity

Procedural terrain and ecology generate the broad world. Curated hero sites, history, landmarks, architecture grammars and biome/ecotone rules create memorable places.

Do not pursue an infinite universe at the expense of meaningful density. Mongo Engine may expand enormously, but every new layer must have gameplay consequences downstream.

## Rule 8 — Presentation scalability is independent of simulation authority

EFFICIENT / BALANCED / HIGH / ULTRA are client presentation policies. They may control:

- screen-space terrain error / tile radius
- vegetation density and draw distance
- dynamic-entity presentation budgets
- shadows and reflection quality
- particles and atmospheric samples
- texture/normal-map resolution
- distant station/ship LOD and impostors

They must not change collision, resource counts, weapon outcomes, construction constraints or authoritative entity existence.

## Rule 9 — Persistent infrastructure is represented at multiple fidelities

A player-built station remains a component graph in authoritative state even when distant. Representation may collapse from individual modules to structural clusters, then to a low-detail silhouette/impostor and aggregated lights.

Same station. Different representation.

## Rule 10 — Build precision tests before seamless travel

Before enabling true interplanetary player flight, Mongo Engine must pass automated tests for:

1. global->local->global round trips over planetary and AU-scale coordinates;
2. repeated origin/reference-frame shifts with no accumulated drift;
3. velocity/orientation preservation across frame transitions;
4. save/reload of global positions independent of the current local origin;
5. multiplayer clients observing the same authoritative global position from different local origins;
6. camera jitter sweeps from centimeters to planetary distances;
7. terrain LOD seam/crack tests across cube-face/quadtree boundaries;
8. bounded streaming work per frame under rapid high-speed travel.

## Lessons from other engines/games

### Star Citizen
Useful: 64-bit positioning, camera-relative rendering, zones/local physics grids, fixed memory budgets for procedural planetary surfaces.
Warning: nested moving physics grids become dramatically more complex once vehicles, interiors, AI navigation and multiplayer interact. Introduce them incrementally with dedicated transition/debug tooling.

### SpaceEngine / Outerra
Useful: cube-sphere hierarchical terrain, on-demand tiles, screen-space LOD, GPU-friendly local precision, detail textures that create perceived centimeter detail without centimeter geometry, user-adjustable generation/loading budgets.
Warning: pushing double precision broadly into consumer-GPU shaders is expensive; solve precision structurally first.

### Kerbal Space Program
Useful: separating high-precision orbital/global state from a local active physics space; origin shifting keeps detailed physics near precision sweet spots.
Warning: reference-frame/origin logic that is implicit or scattered becomes a source of "Kraken"-class bugs. Mongo Engine should have explicit coordinate types and one conversion boundary.

### No Man's Sky
Useful: continuous procedural generation pipeline from terrain through texturing/population; artist-authored modular building blocks multiply variety.
Warning: mathematical scale alone does not create meaningful exploration. Procedural systems need history, ecology, resource/logistics consequences and curated focal points.

### EVE Online
Useful: hardware-scaled LOD/culling and long-term graphical overhauls while preserving a persistent shared simulation.
Warning: large multiplayer scenes must permit presentation degradation without losing gameplay-relevant information.

## Mongo Labs decision

Do **not** convert the entire current engine to doubles in one patch.

First introduce typed global/reference/local coordinate architecture and precision-invariant tests. Then migrate systems intentionally. The existing Frontier surface remains a local frame while the new orbital/infrastructure layer becomes the proving ground for global coordinates.

This keeps current gameplay stable while building the correct foundation for later seamless planet-to-space travel.
