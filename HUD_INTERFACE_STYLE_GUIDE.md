# MONGO LABS — HUD / PLAYER INTERFACE LANGUAGE

Brick 019.8 establishes a shared interface language for the two control contexts.

## Core rule

> The Frontier HUD is the machine's perception of the world.
>
> The Orbital UI is the nervous system of the facility.

The two interfaces share typography, colors, bracket geometry and interaction
language, but they do not expose the same information hierarchy.

## Shared visual vocabulary

- cyan: normal machine information / sensors / navigation
- green: confirmed / synchronized / healthy
- amber: caution / incomplete / limited
- red-orange: threat / overload / damage
- white: primary readable data
- dark translucent glass: interface foundation
- incomplete brackets and thin rails: structural framing

Avoid a full rectangular border around every line of information.
Avoid permanent panels for information that is not currently relevant.

## Frontier — external view

Permanent information:
- unit / chassis identity
- biome / traversal state
- armor / mass
- heading / sensor bearing
- core condition
- cargo/resource summary
- context action rail

Context-only information:
- swimming / depth / free diving only while in water
- threat warning only when a threat exists
- intent log only while resolving/training/typing
- save state as a quiet status line

## Frontier — first-person optics

`V` switches between external follow camera and optical-array first person.

Starter Unit 001 does not pretend to contain a human cockpit. First person is
its forward optical/sensor array.

The optical HUD should remain sparse:
- center reticle
- optical/sensor tier label
- context classification when available
- heading strip
- machine condition at the periphery

Future chassis/modules may extend this with:
- thermal
- electromagnetic
- mineral
- structural
- signal
- anomaly
- tactical sensor fusion

HUD capability must follow installed hardware rather than magically appearing.

## Chassis evolution

The same persistent Unit 001 should feel increasingly different to inhabit.

Light expedition frame:
- survey optics
- simple armor/core state
- low information density

Industrial/salvage frame:
- tool load
- torque
- cargo
- power routing
- salvage classification

Heavy combat-capable frame:
- armor sectors
- heat/cooling
- weapon groups
- threat vectors
- subsystem status

Endgame machine:
- sensor fusion
- ECM
- drones
- tactical projection
- subsystem targeting

## Orbital caretaker

The station movement HUD is intentionally sparse.

Permanent information:
- station/caretaker identity
- integrity/security state
- linked Frontier unit
- station bus / uplink state
- interaction rail

Research, refit, logistics and planetary observation should become dedicated
subsystem workspaces opened through station equipment rather than permanently
occupying the movement HUD.

## Debug separation

Player HUD and engineering/debug HUD are separate products.

The player HUD may be stylish and sparse.
The debug HUD may be information-dense and ugly if that improves diagnosis.
Never force shipping players to live inside engineering telemetry.


## First-person input ownership — Brick 019.8.1

First-person optics are an embodied machine-control mode, not a cursor-driven
overlay.

Entering optics:
- hide desktop pointer;
- capture relative mouse motion;
- mouse motion directly controls sensor yaw/pitch;
- no mouse button is required.

Opening an Intent command temporarily changes ownership:

```text
OPTICS FREE LOOK -> COMMAND INPUT -> OPTICS FREE LOOK
```

The command panel may remain visually sparse; it must not force the player to
use a mouse cursor merely to type an Intent.

External camera and station movement retain their separate pointer behavior.


## Segmented action controls — Brick 019.9

Bottom action rails must not be long prose strings.

Each active action is presented as:

```text
[ KEYCAP ]  ACTION LABEL
```

Keycaps describe the physical/user control.
Labels describe the current machine interpretation.

Examples:

```text
[ V ]      OPTICS
[ F4 ]     UPLINK
[ ENTER ]  INTENT
```

This matters because the same key may later map to different actions depending
on:
- chassis;
- installed sensor package;
- active station subsystem;
- nearby interactable;
- damage state.

Action rails should use fixed spacing and intentional grouping rather than
allowing text to hang beyond panel structure.

The visual priority remains:

1. world;
2. immediate machine condition;
3. context action;
4. optional progression/status detail;
5. debug data only when explicitly requested.


## Containment rule — Brick 019.9.1

Player-facing text must obey one of two states:

```text
BOUNDED
text belongs to a complete visual module

UNBOUNDED
text is intentionally free-standing instrumentation
such as the optical reticle / heading marks
```

Never use a partial box that visually implies a boundary while leaving the
associated text hanging beyond or beside it.

Action controls are complete tiles:

```text
┌───────────────┐
│ ENTER | INTENT│
└───────────────┘
```

not:

```text
[ENTER]  INTENT
         ^ loose label
```

This rule applies to both Frontier and Orbital player HUDs.
Debug HUDs may remain utilitarian.


## Width-safety rule — Brick 019.9.2

Player-facing modules must not depend on a sentence fitting by coincidence.

Prefer structured telemetry:

```text
LABEL   VALUE
LABEL   VALUE
LABEL   VALUE
```

over:

```text
LABEL VALUE // LABEL VALUE // LABEL VALUE // LABEL VALUE
```

For dynamic text:
- calculate or conservatively estimate available glyph capacity;
- clip with an ellipsis before rendering;
- reserve interior padding;
- never let changing game data determine whether a border is violated.

Headers, body rows, status footers and action controls should occupy explicit
lanes inside the module.

The visual goal is an instrument panel, not a text dump.

## 019.15 navigation + advisory standard

- Compass cardinal labels are live instrumentation, never fixed decoration.
- Planetary convention is NORTH = world -Z and EAST = world +X.
- Sensor bearings and compass headings must use the same shared convention.
- Environmental discovery uses restrained machine returns (bearing + range),
  not giant quest arrows.
- Capability/caution advisories target about four seconds of readable dwell;
  repeated triggers refresh the timer rather than flash faster.
- Aquatic HUD distinguishes bottom depth from actual chassis submersion and
  reports bottom-walking as `BOTTOM_TRANSIT`, not `SWIMMING`.
