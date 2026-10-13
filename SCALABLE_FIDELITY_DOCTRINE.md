# Mongo Engine — Scalable Fidelity Doctrine

Mongo Engine targets a GTX 1070-class machine as a **beautiful baseline**, not as an upper ceiling. Simulation authority and player interaction rules remain identical across hardware. Presentation scales independently.

## Rules

1. **Same world, different representation.** A low-tier client and an Ultra client receive the same authoritative entities, damage, cargo, construction, station state, and interactions.
2. **Spend hardware on distance and density first.** Stronger GPUs may extend terrain/vista radius, object LOD distance, vegetation density, visible-player budgets, shadows, particles, reflections, atmosphere, and material resolution.
3. **Never buy gameplay advantage with graphics.** Lower tiers may simplify or aggregate distant visuals, but must retain readable silhouettes, threats, interactables, projectiles, navigation markers, and combat-relevant state.
4. **LOD is architectural.** Ships, stations, robots, flora and infrastructure need FAR/MID/NEAR representations from the beginning.
5. **Simulation is not rendered population.** MMO server interest management may track many entities while each client renders a hardware-appropriate subset/LOD.
6. **Shared materials and instancing before brute force.** Extra fidelity should come from longer view distance, richer geometry/material tiers and atmosphere after batching/culling/instancing are healthy.
7. **High-end headroom stays open.** Future renderer upgrades may add larger textures, denser mesh LODs, better shadows/reflections and richer effects without changing content definitions or world rules.

## Brick 019.18.2 foundation

`F6` cycles presentation profiles:

- **EFFICIENT** — tighter terrain/vista radius, 512 shadow map, reduced refresh cost.
- **BALANCED** — current GTX-1070-oriented baseline; 1024 shadows and current world radius.
- **HIGH** — farther world representation and higher shadow resolution.
- **ULTRA** — aggressive view radius and 2048 shadows for stronger hardware.

The profile structure also reserves future visible-dynamic-entity, FX and decoration budgets for the MMO renderer. Those budgets will become active as multiplayer/entity LOD systems land; they are intentionally presentation-only.
