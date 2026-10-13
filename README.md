# Brick 019.19.2 — Frontier Unit Refit Foundation

> **STATUS:** refit architecture, persistence, traversal proof, and regression contracts validated locally. The Windows UCRT64 direct-g++ application build and GTX 1070 live render remain the authoritative compile/render gates.

Brick 019.19.2 turns the physical cradle inside Orbital Vessel 001 into the canonical **Frontier Unit Refit Bay**. Mobility is now equipped hardware rather than a hardcoded traversal constant. The bay begins with two stock schematics: the existing **Biped Expedition Rig** and a visibly different **Spider Traversal Rig** with eight articulated legs.

## Refit loop

1. `F4` transfer control to the Orbital Caretaker.
2. Walk to the physical Unit 001 cradle / Refit Bay and press `E`.
3. Press `1` for **Biped Expedition Rig** or `2` for **Spider Traversal Rig**.
4. The first Spider fabrication spends real **Orbital Vessel Stores**: Blue Crystal x18, Ancient Alloy Fragment x12, Ancient Actuator Servo x6, Manipulator Cluster x2. Once fabricated, swapping back to an already-owned rig does not repay the full fabrication cost.
5. The bay preview changes to the selected physical configuration and reports slope, speed, stability, mass, cargo, and mobility power draw.
6. Press `F4` to deploy. If the selected rig differs from the deployed rig, the Matter Ladder reconstructs Unit 001 in that fabricated configuration and persistence commits the equipped schematic.

## First architecture proof

The existing slope soft gate now reads `FrontierWorld::equipped_mobility_profile()` instead of assuming Light Expedition legs. Biped retains a 38-degree maximum slope envelope; Spider raises the envelope to 60 degrees but is slower, heavier, and more power-hungry. A deterministic pure-C++ test searches the generated Frontier for a real slope between those envelopes, proves Biped is blocked with `SLOPE TOO STEEP FOR CURRENT CONFIGURATION`, equips Spider, and proves the exact same attempted climb succeeds.

Pressure and water rules do not regress: both stock rigs remain negatively buoyant bottom-walkers, unsafe pressure remains a retreatable soft physical gate, and no refit grants magical swimming.

## Persistence

Character schema **9** adds deployed/selected mobility schematic IDs plus fabricated-rig ownership. On restore, the equipped schematic rehydrates the live world mobility authority before play resumes. Unit cargo and Orbital Vessel stores remain physically separate owners.

---

# Brick 019.19.1 — Physical Inventory Separation

Brick 019.19.1 makes logistics physical across bodies. Unit 001 cargo and Orbital Vessel 001 stores are now distinct persistent inventories. The Matter Ladder transfers all currently implemented physical cargo categories upward rather than deleting them, and `I` opens the inventory belonging to the body currently under player control. Direct `E` interaction no longer reports a missing crystal unless a crystal interaction was actually selected; empty-space interaction reports a generic target message.

## Inventory ownership

- Frontier `I`: Unit 001 cargo + salvage. Cargo mass affects encumbrance.
- Orbital `I`: Orbital Vessel stores + materials. Construction consumes vessel blue-crystal stock.
- Matter Ladder: physically moves current cargo from Unit 001 into vessel stores and commits the transfer.
- Future stations/vehicles/containers remain separate owners rather than sharing a magic global bag.

## Lineage

# Brick 019.19 — Persistent Infrastructure Foundation

> **STATUS:** local logic/persistence/contracts validated. The Windows SDL3/OpenGL direct-g++ build and GTX 1070 live render remain the authoritative compile/render gates.

Brick 019.19 turns the orbital-construction doctrine into the first playable engineering sandbox. Orbital Vessel 001 remains the player's damaged mobile base; player-built stations are separate persistent component graphs anchored to stable Pelagos orbital site IDs. The first seven sites form an axial-hex neighborhood. Construction spends real blue-crystal stock delivered through the Matter Ladder, and every installed module contributes physical engineering values rather than a generic station level.

## First playable orbital construction loop

1. `F4` transfer to the Orbital Caretaker.
2. `V` switch to Orbital Vessel exterior inspection.
3. `B` open **ORBITAL CONSTRUCTION**.
4. `[` / `]` choose a Pelagos orbital construction site.
5. `C` places the site's **Construction Core** at axial cell `q0 r0` if orbital crystal stock can pay for it.
6. `WASD` moves the station-cell cursor across the axial construction grid.
7. `1..8` installs an official module at the selected cell:
   - `1` Structural Truss
   - `2` Fusion Reactor
   - `3` Thermal Radiator
   - `4` Cargo Module
   - `5` Docking Collar
   - `6` Material Refinery
   - `7` Sensor / Comms Array
   - `8` Heavy Hardpoint Frame
8. `R` rotates the next placement in 60-degree steps.
9. `X` / `Delete` deconstructs the selected module and recovers half its crystal cost. The graph rejects removals that would sever the station or remove a supporting core.
10. `B` or `Esc` closes the planner.

## Engineering instead of arbitrary classes

Each module contributes **mass, structural capacity, power generation/draw, heat generation/rejection, cargo capacity, hardpoints, and crystal cost**. Power and thermal deficits are deliberately allowed: the planner warns rather than inventing a hard class restriction. Structural failure and orbital-site mass limits are hard construction constraints because they define whether a physical structure can presently exist.

The first module graph is persisted in **schema 7** as stable module IDs plus site, axial cell, deck, orientation, and official module type. This is intentionally independent from the current local render coordinates so a future large-world/reference-frame system can move the installation into true orbital space without rewriting the player's design.

## Large-world seed

`engine/world/ReferenceFrame.h` introduces explicit `ReferenceFrameId` and `GlobalPosition` vocabulary. Brick 019.19 does **not** attempt seamless interplanetary flight yet; it establishes the type boundary so later large-world work can keep authoritative astronomical coordinates separate from local physics and camera-relative GPU coordinates.

## Validation rule

Mongo Labs now treats three gates separately:

- **CONTRACT:** architecture/invariant tests.
- **COMPILE:** the real Windows UCRT64 direct-g++ application build.
- **LIVE:** the actual SDL3/OpenGL game on the GTX 1070-class baseline machine.

A local contract pass is never described as a Windows compile pass.

---

## Inherited 019.18.2 release notes

Historical visual lineage retained for regression coverage: **Orbital Station Beauty** remains the interior presentation baseline beneath Orbital Vessel 001.

Orbital presentation also retains the **360-degree procedural cosmic sky** and domain-warped **nebula** baseline established before the vessel exterior pass.

# Brick 019.18.2 — World Asset + HUD Consolidation

> **HOTFIX:** The initial 019.18.2 package contained a stale cache-member name in `FrontierRenderer3D::set_fidelity_tier()` that failed the Windows direct-g++ build. This package uses `frontier_static_site_cache_valid_` and includes a regression contract for the exact failure.

Compatibility lineage: **Brick 019.18 — Living World Foundation** remains the ecology, atmosphere, vegetation, and ambient-wildlife base beneath the 019.18.1 ecotone work and this consolidation pass.

Brick 019.18.2 closes the first live-test loop after **Brick 019.18.1** and turns several player-visible systems into real gameplay instead of placeholders. The 019.18.1 **ecotone** terrain/vegetation/wildlife blending remains the world-surface baseline, and the graphics rule remains to maximize **perceived richness** per unit of GPU cost rather than brute-force detail. `I` now opens Unit 001's cargo/salvage inventory. Ancient Scavengers leave a physical wreck that can be salvaged exactly once; weighted intact-component rolls are deterministic from the wreck identity, so reloads cannot reroll rare hardware. Salvage has physical mass, contributes to encumbrance, and persists in the character save.

The machine-condition HUD now uses understandable terminology: **STRESS** and **ARMOR** replace vague `FLUX` / `SHLD` presentation. Internal Core Flux remains an implementation name for accumulated electronic/radiation stress, but the player-facing machine state uses readable terms such as NOMINAL, ELEVATED, DEGRADED, CRITICAL and EMERGENCY.

The Matter Ladder receives a second modeling pass with containment toroids, induction housings and clearer negative space. Ancient Scavengers retain the darker archaeological silhouette but gain restrained service-light anatomy and a distinct shutdown/wreck presentation. Orbital Vessel 001 now uses conservative compound camera-collision volumes in exterior inspection so the camera cannot freely tunnel through the pressure hull, service shoulders, engine block or radiator span.

## Scalable Fidelity

Mongo Engine now treats a GTX 1070-class machine as a **beautiful baseline, not a ceiling**. `F6` cycles **EFFICIENT / BALANCED / HIGH / ULTRA** presentation profiles. BALANCED preserves the 019.18.1 terrain and 1024px shadow budget; lower/higher tiers adjust terrain/vista representation radius, shadow resolution and refresh cadence while leaving gameplay and simulation unchanged. The profile structure also reserves future per-client entity/FX/decor budgets for MMO LOD and interest presentation. See `SCALABLE_FIDELITY_DOCTRINE.md`.

## Current loop

Explore → collect crystals → carry physical mass → become encumbered → Matter Ladder transfer → orbital stockpile, while dormant Ancient Scavengers can wake, be disabled, leave wrecks and yield salvage that will feed the modular refit system.

## Next architecture

Brick **019.19 — Persistent Infrastructure Foundation** is reserved for the first small, testable slice of the player-civilization sandbox: orbital construction hexes, construction cores, declarative station modules, engineering budgets (mass / power / heat / volume / hardpoints), physical material costs and persistent player-built orbital structures. See `PERSISTENT_INFRASTRUCTURE_DOCTRINE.md`.

Local validation for this release: **80/80 Python contract files PASS** plus focused pure-C++ orbital-infrastructure, character-persistence, orbital-station, cargo and fidelity regression groups. Windows SDL3/OpenGL live rendering remains final authority.

## Large-world research

See `LARGE_WORLD_ARCHITECTURE_DOCTRINE.md` for the precision/reference-frame/planetary-LOD architecture we will use before seamless interplanetary flight.

## Historical compatibility lineage

The current release intentionally preserves the documented milestones that the fast Windows smoke wall verifies from earlier bricks. These labels are historical lineage markers, not claims that the current brick has rolled back to those versions:

- **Brick 019.16.2** — UCRT64 runtime-chain hardening, including **transitive runtime dependencies**.
- **Brick 019.16.6 — Macro Silhouette Pass IV** — Unit 001 gameplay-distance silhouette and visual-fidelity baseline.
- **Brick 019.17 — Engine Visual Expansion** — native cylinder/instancing and celestial visual expansion.
- **Brick 019.17.1 — Hard-Surface Graphics Engine** — bevel/taper/ring primitives and night-sun leakage hardening.
- **Brick 019.18 — Living World Foundation** — ecology fields, atmospheric response, vegetation density and world-owned ambient wildlife.
- **Orbital industrial refit** presentation remains part of the inherited station-detail baseline.
- Terrain Material V2 retained its promise of **no new texture fetches** and **no new draw calls** for that shader-side material expansion.
- Water rendering **deliberately avoids planar reflections** on the baseline path.
- Shoreline / immersion optics retained their historical validation targets of **115/115** and **116/116** during that progression.

These markers remain in the README because the DEV smoke contracts deliberately verify that later consolidation bricks preserve their inherited subsystem documentation and guarantees.
