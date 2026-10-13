# Mongo Engine — Systemic Sandbox Design Doctrine

## Core thesis

**Procedural generation builds the universe. Simulation gives it meaning. Player agency creates the story.**

Mongo Engine is intended to be both an open world/universe and a systemic sandbox. Geographic scale alone is not enough. The engine should create rules, histories, materials, machines and environments that can interact in ways that support solutions the player chooses rather than forcing one authored path.

## Seven standing rules

1. **Systems before scripts.** Build reusable rules that can produce situations instead of hard-coding a unique solution for every encounter.
2. **Capabilities before classes.** Unit 001 and Orbital Vessel 001 become what their installed components physically allow them to become.
3. **Problems before prescribed solutions.** Obstacles should expose properties and constraints; multiple tools/configurations may satisfy them.
4. **Persistent consequences.** Harvested deposits, built infrastructure, awakened machines, discovered history and logistics state should survive save/load and matter later.
5. **Physicality matters.** Mass, power, heat, pressure, traction, buoyancy, cargo, materials and environment should produce actual gameplay consequences.
6. **Discovery before explanation.** The player may encounter objects, ruins, materials and machine behavior long before Schema confidence is sufficient to explain them.
7. **Intent should query simulation.** The long-term Intent Engine goal is to answer “can I try this?” from known Schema, available materials/components and world rules rather than from a fixed command menu.

## World-generation rule

A planet should be generated as a causal stack rather than a set of painted biome islands:

```text
STAR / ORBIT / AXIAL TILT
        ↓
PLANET COMPOSITION
        ↓
CLIMATE + ATMOSPHERE
        ↓
GEOLOGY + ELEVATION
        ↓
EROSION + HYDROLOGY
        ↓
SOIL / MINERAL CHEMISTRY
        ↓
ECOLOGY + ECOTONES
        ↓
WILDLIFE / RESOURCES
        ↓
HISTORY / RUINS / MACHINES
```

Procedural systems establish the broad base. Authored-looking grammar spends detail at places the player inspects: ruins, wrecks, geological hero forms, machine graveyards, landing zones, caves and infrastructure.

## Progression rule

Progression should usually be expressed as new **capabilities**, not level gates.

Examples:
- pressure-rated chassis → deeper bottom traversal;
- spider/climbing mobility → steeper terrain;
- stronger actuators → heavier tools/cargo but more power/mass;
- aquatic propulsion/buoyancy → different underwater locomotion;
- new Schema → new engineering possibilities;
- recovered Schematic → a specific fabricable design.

A boss, NPC conversation or mandatory story checkpoint should not be required merely because the player needs a capability that the simulation can otherwise justify.

## Two-body player architecture

Unit 001 is the player's **planetary body**. Orbital Vessel 001 is the player's **system-scale body**.

Both should obey the same engineering philosophy: modules consume physical volume, mass, power, cooling and attachment space; changing configuration changes what the player can do. The vessel interior must correspond to exterior hull volumes rather than becoming disconnected menu geometry.

## Logistics rule

Resources should travel through physical systems when practical:

```text
DISCOVER → HARVEST/SALVAGE → CARRY → TRANSFER → ORBITAL STOCK → ANALYZE/REFINE/FABRICATE → RECONFIGURE
```

Brick 019.18.1 begins this with blue-crystal mass, encumbrance and Matter Ladder transfer into persistent Orbital AI stock.

## Failure rule

Prefer **state changes and soft capability gates** to arbitrary death/reload when the fiction supports it.

Examples already authoritative:
- `SLOPE TOO STEEP FOR CURRENT CONFIGURATION`
- `PRESSURE TOO GREAT FOR CURRENT CONFIGURATION`
- cargo overload produces reduced mobility / pickup refusal rather than deleting cargo or killing Unit 001.

Future failures can create repair, logistics, sensor, power or navigation problems that become gameplay instead of merely ending it.

## Simulation-resolution rule

The universe does not need maximum fidelity everywhere simultaneously.

```text
IMMEDIATE SPACE  → full local simulation/rendering
REGION           → reduced ecology/weather/resources/events
PLANET           → climate/history/infrastructure state
STAR SYSTEM      → orbital bodies + macro events
DISTANT UNIVERSE → deterministic seed + persistent deltas
```

Approach hydrates state into higher fidelity; departure collapses it back into persistent summaries. This is the scaling path for a large universe while preserving the GTX 1070 baseline.

## Anti-patterns

Avoid:
- giant maps whose only difference is noise seed + color;
- mandatory golden-path progression masquerading as a sandbox;
- thousands of shallow recipes with little systemic interaction;
- renderer-only “gameplay” objects that the world simulation does not own;
- arbitrary biome borders when environmental fields can create ecotones;
- one-off quest props when reusable capabilities can solve the same design problem.

## Next architecture brick

**Brick 019.19 — Systemic Sandbox Foundation** should formalize common reusable properties for materials, components, machines, environment and Intent Engine affordances. It should be a foundation brick rather than a content dump.
