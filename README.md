# Space Devil

A 2D space navigation game built in Godot 4.6.

## Gameplay

Navigate your spaceship through asteroid fields to reach the star and progress to the next level. Manage your fuel carefully - it depletes over time!

### Controls

- **Arrow Keys** or **WASD** - Move the spaceship

### Mechanics

- **Objective**: Reach the star to advance to the next level
- **Hazards**: Avoid metereos (asteroids) - collision destroys your ship
- **Fuel**: Health bar depletes over time; reach the star before running out
- **Gravity**: Some levels feature gravitational pull from celestial objects
- **5 Levels**: Progressive difficulty with unique challenges

## Tech Stack

- **Engine**: Godot 4.6
- **Language**: GDScript
- **Renderer**: GL Compatibility (D3D12 on Windows)
- **Physics**: Jolt Physics (3D)
- **Plugins**: 
  - HealthBarX - Health bar UI
  - GazeAI - AI-assisted development

## Project Structure

```
├── Scenes/
│   ├── Levels/       # Level scenes (level_1 through level_5)
│   ├── space_ship.tscn
│   ├── matereos.tscn # Asteroid/meteorite
│   ├── star.tscn     # Level objective
│   └── black_hole.tscn
├── Scripts/
│   ├── Levels/       # Level-specific logic
│   ├── Components/   # Reusable components
│   ├── space_ship.gd
│   ├── matereos.gd
│   └── drag.gd       # Gravity system
└── Assets/
    └── space_background_pack/
```

## Running the Game

1. Open the project in Godot 4.6+
2. Press F5 or click "Play" to run
