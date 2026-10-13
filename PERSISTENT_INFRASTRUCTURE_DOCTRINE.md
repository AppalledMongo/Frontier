# Mongo Engine — Persistent Infrastructure Doctrine

Mongo Engine takes the strongest lesson from early persistent-world space games: infrastructure should be **something players actually build, supply, operate, defend and remember**, not a menu flag. We deliberately avoid structure spam, giant HP-grind warfare, opaque super-roles, recurring fuel chores with no engineering choices, and magical risk-free storage.

## Construction rule

**We do not ask whether the player is allowed to build an idea. We ask what that idea physically requires.**

A player who wants fifty capital energy weapons may attempt it. The station must then satisfy the resulting structural hardpoints, power generation, peak storage, heat rejection, internal volume, material cost, targeting, maintenance and defense consequences. Balance emerges primarily from linked engineering constraints rather than arbitrary class caps.

## Spatial hierarchy

- Star systems expose strategically meaningful orbital construction regions / hexes.
- A hex describes orbital geography and infrastructure capacity, not automatic political ownership.
- A Construction Core establishes one persistent installation graph.
- Modules occupy physical cells / footprints and connect through declared interfaces.
- Major modules may span multiple cells and decks.

## Derived stations, not station classes

A station is a persistent graph of official server-authoritative components. Its role is derived from what the player actually installs: reactors, cargo, refineries, laboratories, docks, sensors, weapons, radiators, fabrication, habitation, propulsion, Matter Ladder hardware, etc. A mining station is a station that was engineered to mine/refine; it is not a class button.

## Engineering budgets

Every build can eventually reason about:

- mass and structural load
- internal/external volume
- continuous and peak power
- heat generation and rejection
- hardpoint class and force transfer
- propulsion / acceleration when mobile
- cargo and logistics throughput
- fabrication / research capacity
- sensors / communications
- maintenance and damage state

Warnings should explain consequences. The game should often permit a deliberately bad or specialized design rather than silently protecting the player from engineering decisions.

## Persistence and history

Infrastructure can be expanded, damaged, crippled, captured, repaired, salvaged or—where server rules permit—destroyed. Ownership and visual history should survive long enough for player-built places to become landmarks. Strategic influence should arise from actual presence, operation, logistics and defense rather than counting cheap structures.

## Permissions

Permissions must be granular from the beginning: docking, deposit, withdrawal, fabrication, refuel, repair, weapons, module editing, hull editing, treasury, access control and decommissioning are separate authorities assignable to players/groups/factions.

## Player appearance packages

Gameplay geometry/components remain server-authoritative. Players may submit approved texture/material/decal packages that the service validates, optimizes, hashes and associates with their structures. Clients render the approved asset; if unavailable they fall back to the stock Mongo model. Shared public content does not execute creator code.

## Scalable MMO presentation

The server may simulate more objects than any one client draws at full fidelity. Stations/ships require FAR / MID / NEAR representations. Client hardware profiles alter LOD distance, density and effects—not authoritative collision, weapon state, cargo, construction or other gameplay truth.

## First implementation target — Brick 019.19

1. Orbital construction hex data.
2. One persistent Construction Core.
3. Declarative module definitions.
4. A small module graph / hex-cell layout.
5. Derived power / heat / mass / cargo calculations.
6. Material costs paid from orbital stock.
7. Save / reload persistence.
8. Stock geometry visualization of the resulting station.


## Brick 019.19 implementation seed

The doctrine now has a playable first implementation: Pelagos exposes seven stable orbital construction sites, stations are persistent component graphs on axial cells, construction consumes Matter-Ladder-delivered crystal stock, and engineering capability is derived from installed modules. The current local exterior rendering is a presentation projection only; site identity is deliberately independent of render coordinates so later reference-frame work can move these structures into true orbital space without invalidating designs.
