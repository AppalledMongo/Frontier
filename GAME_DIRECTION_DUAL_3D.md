# Mongo Engine — Dual 3D Game Direction

## Hard rule

Both halves of the game are fully 3D.

There is no permanent 2D management layer.

The player owns two linked persistent entities:

```text
3D ORBITAL STARTER STATION
Orbital Caretaker AI
        ⇅
communications / logistics / control transfer
        ⇅
3D FRONTIER PLANET
Frontier Unit / Pioneer
```

UI panels may appear over consoles and terminals, but station gameplay is represented through physical rooms, machinery, consoles, bays, relays, and navigable space wherever practical.

## Orbital Caretaker AI

The starter station AI is a strategic support entity with its own persistent progression and survivability.

Future systems include:

- station armor
- firewall
- redundancy
- recovery systems
- defensive procedures
- research
- logistics
- satellite control
- care packages
- communications
- mapping
- weather intelligence
- ECM / electronic warfare
- countermeasures
- orbital AI-vs-AI competition

New accounts begin under novice protection.

After novice protection expires, other players may attack the orbital AI.

Defeat does not erase the account or surface character.

Instead:

```text
ORBITAL AI DEFEATED
        ↓
AI OFFLINE
        ↓
long autonomous recovery timer
```

During AI downtime the surface player remains playable, but orbital support is degraded or unavailable.

A wealthy or capable pioneer can later reduce recovery time from planetary terminals, specialized outposts, spare processors, relay facilities, or other surface infrastructure.

Core balance rule:

> Defeating one half disadvantages the other half. It never makes the other half unplayable.

## Frontier Unit

The Frontier Unit is a persistent modular machine.

It begins as a light expedition platform and can eventually be modified into very different machines.

Planned module domains:

- chassis
- sensor/head package
- power core
- left manipulator/tool
- right manipulator/tool
- mobility
- armor
- cargo
- rear/back module
- utility slots

The unit's physical 3D model should eventually reflect installed hardware.

Possible specializations emerge from modules rather than rigid classes:

- survey
- industrial/mining
- aquatic
- logistics
- construction
- rescue
- heavy security
- communications
- electronic warfare

Skills and modules combine rather than replace each other.

## Communications are physical gameplay

Orbital support is not omniscient.

Link quality may depend on:

- transmitter quality
- relay coverage
- satellite coverage
- terrain
- weather
- electrical storms
- planetary anomalies
- damaged hardware
- ECM
- hostile jamming

Degradation should scale rather than simply disable the game.

Example:

```text
UPLINK 92%  STABLE
UPLINK 51%  DEGRADED
UPLINK 18%  BURST MODE
UPLINK  0%  SIGNAL LOST
```

Surface-local gameplay continues even with no orbital link.

## Electronic warfare

Future players may interfere with communications and logistics.

Possible effects:

- degraded orbital maps
- delayed caretaker responses
- reduced satellite intelligence
- care-package inaccuracy
- relay disruption
- temporary denial of orbital services

Jamming must have counterplay and costs:

- high power draw
- detectable emissions
- triangulation
- directional antennas
- frequency agility
- hardened relays
- anti-jam processing
- physical destruction of jammer infrastructure

Electronic warfare creates conflict without making another player's client unusable.

## Surface infrastructure feeds back into orbit

The relationship is two-way:

```text
ORBITAL AI
helps pioneer
        ↓
PIONEER
gains skills/resources
        ↓
OUTPOSTS / RELAYS / INDUSTRY
        ↓
help repair / strengthen orbital AI
        ↓
better orbital support
```

Outposts can eventually provide:

- relay coverage
- repair terminals
- AI recovery acceleration
- care-package receivers
- fabrication
- satellite control
- field refit capability
- communications resilience

## MMO direction

Today:

```text
one process
one account
one Orbital AI
one Frontier Unit
```

Later:

```text
many accounts
many Orbital AIs
many Frontier Units
shared stations / regions / infrastructure / conflict
```

The current local game should behave as a one-player authoritative universe while preserving server-ready identities and storage boundaries.

## Design pillar

**Information, logistics, communication, and support all have physical infrastructure.**

And:

**Both orbit and frontier are places the player inhabits in 3D.**


## Mystery / salvage / research progression

The frontier is not an untouched empty planet.

Exploration should occasionally reveal Before-Time remains:

- battlefields
- biological remains
- mechanical wrecks
- dead relays
- ruined research sites
- machine graveyards
- buried infrastructure
- unknown hybrid technology

Some recoverable objects are useful because of what they are. Others are
valuable because of what the Orbital Caretaker can learn from them.

### Matter Ladders

Rare ancient or player-built transfer sites can move small physical salvage
between Frontier and Orbit.

Early-game Matter Ladders are infrastructure, not player teleporters.

They support:

- artifact transfer
- sample storage
- orbital inspection
- destructive/non-destructive analysis
- schema compilation
- blueprint recovery
- reverse engineering
- experimental invention

Blue Crystal is a candidate energy/coupling resource for Matter Ladder use.

### Schema vs schematic

A **schema** is the Caretaker's accumulated understanding of a technology
family.

A **schematic** is a buildable design derived from known schemas, recovered
blueprints, reverse engineering, or invention.

The same Frontier Unit should evolve continuously from LIGHT_EXPEDITION into
increasingly extreme specialized machines rather than being replaced with a
different character.

### Orbital scans

Blue Crystal can eventually fuel orbital analysis/scans.

Scans should not conjure loot. They improve interpretation and discovery:

- detect probable salvage
- identify buried signatures
- bias recovery toward known/tracked schematic needs
- improve hazard knowledge
- identify unknown technology as UNKNOWN rather than forcing a false match

Signal quality, storms, relays, satellite coverage, ECM, and hostile jamming
can modify scan reliability.

### Threat philosophy

Mystery sites and valuable resources need problems:

- Before-Time drones
- dormant defenses
- unstable power systems
- radiation/electromagnetic hazards
- biological hazards
- environmental conditions
- eventual hostile players

The first implemented example is the Ancient Scavenger Drone + Core Flux
system in Brick 019.1.


## Presentation rule — Brick 019.2 onward

Visual polish is part of every gameplay brick, not a deferred final phase.

The target is not raw photorealism. The target is a coherent stylized world
that can occasionally be breathtaking while remaining compatible with huge
procedural spaces and modest hardware.

Prefer:
- silhouette over polygon count
- atmospheric depth over view-distance clutter
- clustered detail over uniform noise
- material contrast over texture spam
- landmark composition over random prop density
- a few memorable animated accents over constant visual motion

Every future mystery site, resource, mob, Matter Ladder, relic, and mech upgrade
should receive both a gameplay pass and a presentation pass.


## Procedural construction + close-detail model groups — Brick 019.2.1 onward

Mongo Engine should prefer procedural assembly for large-scale content:

- orbital stations
- frontier outposts
- ruins
- battlefields
- wreck fields
- Matter Ladder sites
- landscape landmarks
- vegetation/ecology fields

The macro structure can be generated from deterministic seeds, reusable kits,
zone rules, and world history.

However, objects the player directly approaches or operates should receive
**close-detail model groups**.

Examples:

- consoles
- doors
- salvage machinery
- refit equipment
- AI core machinery
- Matter Ladder interfaces
- recovered artifacts
- mech hardpoints
- corpses / biological remains
- blueprint or analysis equipment

The renderer may keep a distant/mid-range object simple, then assemble richer
panels, conduits, controls, lamps, clamps, vents, and readable materials only
inside an inspection radius.

This preserves a huge procedural world while allowing the spaces immediately
around the player to feel authored and detailed.

### Presentation hierarchy

```text
FAR
    silhouette / landmark / atmosphere

MID
    structural module / biome identity / recognizable site

NEAR
    close-detail model group / interaction affordance / material storytelling
```

Do not distribute detail uniformly.

Spend detail where the player looks, walks, touches, salvages, repairs,
analyzes, or builds.


## Renderer foundation — Brick 019.3 onward

Visual quality should increasingly be inherited from a shared renderer rather
than recreated as one-off tricks inside every object.

The rendering stack now assumes:

```text
HDR scene
→ coherent lighting
→ directional shadowing
→ emissive energy
→ post-process bloom
→ filmic tone mapping
```

Future visual work should preserve the procedural / scalable philosophy.

Prefer improving shared systems when those improvements benefit:
- Frontier
- Orbital station
- mechs
- ruins
- Matter Ladders
- salvage
- biological remains
- ancient machinery
- resource fields

### Shadow budget

Near/mid shadow quality matters more than shadowing the distant horizon.

Distant composition should rely heavily on:
- silhouette
- haze
- color separation
- large forms

### Orbital-space requirement

The fixed star rectangle behind the current observation planet is temporary.

The orbital environment must evolve into a camera-centered 360-degree space
sky so every station window and open structural view sees a coherent universe,
not a backdrop plane.

The star/nebula field should behave as effectively infinite background
directional data and should not translate with normal station movement.


## 360-degree procedural cosmic environment — Brick 019.4 onward

Orbital backgrounds must be directional and camera-centered.

Do not represent distant stars as nearby world-space points or as a rectangular
backdrop.

### Celestial hierarchy

```text
INFINITE / DIRECTIONAL
stars
galactic band
nebulae
extremely distant bodies

POSITIONAL / PARALLAX
debris
satellites
ships
asteroids
nearby stations
local orbital infrastructure
```

The two layers solve different visual problems and should remain distinct.

### Starfield

Use deterministic multi-population star generation:
- dim dense population;
- medium population;
- bright sparse population;
- galactic-density enhancement;
- rare hero stars.

Temperature variation should produce warm, neutral, and hot-blue stars.

### Nebula

Use scalable procedural noise:
- 3D directional coordinates;
- low-octave FBM;
- domain warping;
- density banding;
- color ramps;
- dust extinction.

Avoid extremely expensive full volumetric ray marching unless future profiling
demonstrates budget.

### Station views

Procedural station architecture should increasingly create framed views into
space rather than treating space as decoration behind one special window.

Every valid opening should reveal the same coherent universe.

### Physical parallax

Do not add translation parallax to distant stars for visual effect.

Use nearby orbital debris / infrastructure when real parallax is desired.


## Persistent procedural landmark rule — Brick 019.4.1 onward

A deterministic world feature must not disappear because its LOD category
changes.

For world-anchored formations:

```text
FAR  -> silhouette
MID  -> same silhouette + secondary structure
NEAR -> same structure + richer local detail
```

LOD may change mesh/detail density, shading, or decoration.

LOD must not change whether the landmark exists.


## Hero landscape composition — Brick 019.5 onward

The Frontier generator should not only scatter isolated props.

Some deterministic chunks become **hero sites**: coherent scene grammars that
create a readable question, silhouette, or historical event.

Initial grammar families:

- Broken Arch / Pre-Collapse Gate
- Ancient Battlefield
- Machine Graveyard
- Matter Ladder Ruin
- Biological Remains / Rib Field

Hero sites are rare, biome-weighted, world-anchored, and deterministic.

### Composition rule

```text
LANDMARK
    +
SECONDARY STRUCTURE
    +
LOCAL DEBRIS / STORY EVIDENCE
    +
DISTANCE-BASED DETAIL
```

A hero site should remain recognizable at distance and reveal more structure as
the player approaches.

Do not make every chunk a spectacle. Calm terrain is required so special sites
have contrast and discovery value.

### Mystery rule

A site can visually imply history before the game explains it.

The player should be able to ask:
- what happened here?
- who built this?
- why was this machine abandoned?
- why does this Matter Ladder still have power?
- what organism left these remains?

Future gameplay layers can attach salvage, scans, hazards, logs, schemas, and
blueprints to these same world-anchored site identities.

## Orbital industrial-detail rule — Brick 019.5 onward

The starter station remains procedurally assembled, but interaction zones need
a denser manufactured language.

Near-player station detail can use reusable kits for:
- crane carriages
- tool racks
- clamps
- diagnostic emitters
- cable trays
- coolant/service pipes
- handrails
- wall utilities
- inspection displays
- module storage

The center camera aisle stays deliberately clean.

Spend visual complexity around:
- AI Core
- Refit Bay
- Logistics
- Satellite Uplink
- Surface Link
- observation galleries

Do not distribute industrial clutter uniformly.


## Hero-site readability rule — Brick 019.5.1 onward

A procedural mystery site must communicate its category before the player reads
text.

Examples:

- machine graveyard -> collapsed/asymmetric machine wreckage;
- biological remains -> vertebrae, curved ribs, skull/joint language;
- Matter Ladder -> engineered frame, damaged components, coherent energy path.

Do not rely on arbitrary primitives plus labels to explain a site.

### Ancient technology visual language

Before-Time machinery should combine:

- structural mass;
- damage/asymmetry;
- buried/weathered foundation;
- surviving service components;
- restrained surviving emissive energy.

Powered does not mean pristine.

### Performance continuity

Expensive visual state may refresh at a lower frequency than simulation when:

- the prior result remains valid;
- visual motion remains convincing;
- gameplay authority is unaffected.

Shadow-map reuse is an example.

The 60 Hz simulation remains authoritative even if a graphics pass updates at
30 Hz.

## Station local-light identity

Orbital zones should use localized visual temperatures instead of uniform room
brightness.

Different subsystems may establish their own palette, but observation space
should remain dark enough for the 360-degree cosmos to dominate.

## Build / boot / release separation — Brick 019.5.2 onward

The full regression console is development infrastructure, not player-facing boot UI.

Keep three distinct workflows:

```text
FULL DEV VALIDATION
BUILD_WINDOWS.bat
→ toolchain checks
→ complete tests/contracts
→ compile
→ launch

FAST DEV ITERATION
BUILD_FAST_WINDOWS.bat
→ compile
→ sync runtime/assets
→ launch

PLAYER / RELEASE BOOT
Mongo Labs presentation
→ real initialization stages
→ game
```

`RUN_GAME.bat` should continue to launch the already-built game without rerunning tests.

Future shipping builds should hide the console by default, preserve diagnostics in log files, and expose explicit developer overrides when needed.

Principle:

**Players boot the universe. Developers boot the laboratory.**


## Deterministic visual-cache rule — Brick 019.5.3 onward

The engine should not repeatedly solve deterministic visual composition if the
inputs have not changed.

For streamed procedural world presentation:

```text
GENERATE when stream identity / LOD identity changes
CACHE deterministic structure
REPLAY cached structure each frame
LIVE-UPDATE only genuinely dynamic effects
INVALIDATE when authoritative visual inputs change
```

Current first implementation:
- alien landmark structure;
- hero-site structure;
- player-chunk scoped cache invalidation;
- dynamic Matter Ladder / landmark energy separated from static structure.

Future caches may become per-world-chunk packages rather than one active-set
package as renderer architecture matures.

## Performance-observability rule

Optimization decisions require live evidence.

The Frontier debug presentation should expose enough timing and count data to
answer:
- CPU frame cost;
- shadow cost;
- terrain cost;
- world submission cost;
- post cost;
- draw count;
- instance count;
- cache behavior.

A performance regression should be traced to a measured subsystem before major
architecture is changed.

**Measure first, optimize second.**


## Cinematic material rule — Brick 019.6 onward

Procedural geometry must not default to looking like unlit debug primitives.

Material identity is part of procedural identity.

```text
shape + color + material response + weathering = readable object
```

A machine graveyard should look metallic and oxidized.
A fossil field should look porous/mineralized.
An alien needle formation should look like fractured geology.

These identities should survive batching, caching and LOD.

### Beauty-before-brute-force rule

Prefer visual gains from:
- composition;
- atmosphere;
- shader materials;
- palette;
- lighting;
- LOD-specific silhouette/detail;

before expensive screen-space or geometry-heavy systems.

The target remains:

> crest a hill and stop moving because the vista is remarkable.

### Material-aware batching

Renderer optimization must not erase art direction. Per-instance material
metadata allows one batched draw to contain multiple procedural material
classes while keeping the fragment shader responsible for the final visual
identity.


## Planetary lighting transition rule — Brick 019.7.1 onward

Day/night must not be implemented as a binary brightness switch.

Planetary presentation should pass through physically motivated visual states:

```text
DAY
direct solar dominance

GOLDEN HOUR
warm direct light + long shadows

TWILIGHT
low warm solar afterglow + cool sky ambient

NIGHT
moon / star / sky ambient with readable exposed materials
```

The underlying simulation should expose continuous solar-elevation-derived
factors so rendering systems can respond without inventing independent clocks.

## Moon phase rule

Moon appearance should be driven by relative sun/moon geometry.

Brightness alone is insufficient.

The visible disc should carry a terminator so orbital motion produces readable
crescent, half, gibbous, and full phases.

## Night readability rule

Night is allowed to be dark.

Night should not erase all material information from ordinary exposed surfaces.

Preserve:
- dark cavities;
- deep silhouettes;
- strong contrast.

But maintain enough sky/moon ambient and exposure adaptation that the player
can still read:
- rock faces;
- ancient machinery;
- wreck silhouettes;
- terrain shape;
- nearby navigation space.

## Stellar frame rule

Distant stars and constellations belong to the star system's inertial frame.

A planet's:
- rotation;
- observer latitude;
- axial tilt

determine how that fixed sky moves across the local horizon.

Sibling planets belong to finite orbital geometry and may visibly change
direction relative to one another.

## Player interface rule — Brick 019.8 onward

The Frontier and Orbital interfaces share one Mongo Labs visual language but
represent different kinds of cognition.

Frontier:

> The HUD is the machine's perception of the world.

Orbital:

> The station interface is the nervous system of the facility.

Player-facing HUD must remain distinct from engineering/debug telemetry.
Persistent information should be sparse; context-sensitive information should
appear when it becomes relevant.

## Frontier view-mode rule

Frontier Unit 001 supports both:
- external follow camera;
- first-person optical-array view.

The starter unit is robotic. First person is therefore a machine sensor view,
not a fake human cockpit.

As Unit 001 evolves, installed chassis and sensor modules should expand what
first person can perceive: thermal, mineral, electromagnetic, structural,
signal, anomaly and tactical layers should be earned by hardware/schema rather
than granted as generic UI powers.

The same persistent Unit 001 should become increasingly different to inhabit as
its frame grows from light explorer through industrial/salvage and heavy-mech
forms.


## Embodied optics input rule — Brick 019.8.1 onward

Frontier first-person is not an alternate screenshot camera.

It represents control from the machine's optical/sensor frame.

Therefore:
- relative mouse movement is captured continuously;
- the desktop pointer is hidden;
- yaw is unrestricted/wrapped;
- pitch is constrained only by plausible sensor/mech articulation;
- movement is relative to the current optical heading.

Text-entry states temporarily own input and suppress look/movement until
submitted or cancelled.

External third-person cameras may continue to use explicit RMB orbit controls.


## Orbital inspection-density rule — Brick 019.9 onward

Orbital architecture follows the same FAR / MID / NEAR presentation hierarchy
as Frontier:

```text
FAR
station silhouette + planet + stars

MID
gantry / wall / refit / uplink / AI-core structural modules

NEAR
clamps / actuators / cable trays / service trenches / displays / glazing seals
```

Do not increase detail uniformly.

Spend close-detail complexity where the Caretaker stops, interacts, repairs,
refits, researches, or looks through the pressure shell.

## Player-interface cohesion rule

A player HUD is not a debug printout.

Control affordances use segmented keycaps.
Persistent telemetry stays compact.
Contextual systems expand only when relevant.

The Frontier interface expresses machine perception.
The Orbital interface expresses facility state and linked-system authority.

## Planetary traversal contract — Brick 019.13

Terrain and water are persistent geography, not level gates that reshape around
the player. Frontier Unit configurations determine access.

- Light Expedition Legs: 30 deg comfortable / 38 deg maximum slope.
- Treads: 32 deg comfortable / 42 deg maximum slope; intended for loose ground,
  mud and heavy industrial loads rather than broken vertical terrain.
- Spider Legs: 45 deg comfortable / 60 deg maximum slope with much greater step
  authority for rocks, ruins and escarpments.
- Deep water is bathymetric world geometry. Surface swimming is distinct from
  controlled descent.
- Environmental capability limits are soft machine gates. Unsupported pressure
  does not instantly kill the player: descent is refused with **PRESSURE TOO
  GREAT FOR CURRENT CONFIGURATION**, allowing retreat and refit.
- Procedural generation should deliberately create both accessible routes and
  aspirational routes/locations visible before the current configuration can
  reach them.

Standing principle: **Capability meets geography.**

## 019.15 traversal clarification — machine buoyancy

Baseline Frontier robots are negatively buoyant. Entering deep water does not
turn Unit 001 into a swimmer: it settles onto submerged terrain and continues
as a walking machine until slope/traction or pressure authority refuses further
travel. Buoyancy, flotation, active ballast and aquatic propulsion are later
configuration choices. Unsafe pressure remains a soft gate, never an instant
kill boundary.
