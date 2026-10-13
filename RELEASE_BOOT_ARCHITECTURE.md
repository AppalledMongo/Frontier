# Mongo Engine — Boot / Build / Release Architecture

This rule is locked in from Brick 019.5.2 onward.

The giant console/test sweep is a **development build workflow**, not the final player boot experience.

## Development modes

### Full validation build

`BUILD_WINDOWS.bat`

Use when:
- receiving a new brick;
- changing renderer/persistence/world architecture;
- preparing a milestone package;
- validating before release.

This path intentionally runs the complete regression/contract suite before the game binary is accepted.

### Fast development build

`BUILD_FAST_WINDOWS.bat`

Use after the full build has already passed and only rapid local iteration is needed.

This path:
- compiles the game;
- syncs runtime DLLs/assets;
- launches the game;
- does **not** rerun the entire regression suite.

### Run only

`RUN_GAME.bat`

This launches an already-built executable. It does not compile or run the test suite.

## Shipping / player boot

A release build must not expose the developer console or regression output by default: **no developer console** is part of the normal player boot.

Target player flow:

```text
MONGO LABS
    ↓
MONGO ENGINE
    ↓
INITIALIZING CARETAKER LINK...
RESTORING FRONTIER STATE...
UPLINK STABLE
    ↓
ENTER UNIVERSE
```

Those messages should correspond to real initialization stages where practical:
- SDL / OpenGL initialization;
- GPU capability checks;
- renderer/HDR/shadow resource creation;
- shader loading/compilation or cached shader preparation;
- save validation/migration;
- character/world authority restoration;
- procedural seed/world-cache initialization;
- server/session connection in multiplayer deployments.

Regression tests belong to CI/development/build validation, not normal player startup.

## Release diagnostics

Shipping builds should still preserve diagnostics without forcing players to stare at a console.

Default release behavior:
- no console window;
- normal player HUD only;
- warnings/errors written to Mongo Labs log storage;
- crash information preserved where possible.

Development overrides may expose diagnostics, for example:

```text
mongo_game.exe --console
mongo_game.exe --debug
```

A future Windows shipping target may use the GUI subsystem (`-mwindows`) once the branded loading/boot presentation exists.

## Principle

**Players boot the universe. Developers boot the laboratory.**
