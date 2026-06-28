# Getting Started With Godot

This guide is for someone who has not used Godot before.

## Install and open the project

1. Install Godot 4.
2. Open Godot.
3. Choose **Import**.
4. Pick the `project.godot` file in this repository.
5. Open the imported project.
6. Press **Run Project** to start the prototype.

Godot may create a `.godot` folder after opening the project. That folder is local
editor data and should not be committed.

## What the main editor areas are

- **FileSystem**: The project files. Scenes, scripts, sounds, and art live here.
- **Scene**: The currently open scene tree. A scene is a reusable piece of the
  game, such as a room, menu, character, or battle.
- **Inspector**: Settings for the selected scene node.
- **Script editor**: Where GDScript files are edited.
- **Output**: Messages printed by the game. Accessibility announcements also
  print here, which helps when testing speech.

## Project layout

- `project.godot`: Godot project settings.
- `scenes/main/main.tscn`: The first playable scene.
- `scripts/main/main.gd`: The prototype movement and interaction logic.
- `scripts/accessibility/accessibility_manager.gd`: Shared speech and
  announcement logic.
- `docs/`: Planning and development notes.

## First safe edits to try

Start with tiny changes and run the project after each one.

1. Change one tile description in `scripts/main/main.gd`.
2. Run the project and move to that tile.
3. Confirm the new text is spoken and shown on screen.

That loop is the safest way to learn Godot: change one thing, run it, verify it.

## Godot terms used in this project

- **Node**: One object in a scene. A player, label, camera, or sound player can be
  a node.
- **Scene**: A saved tree of nodes.
- **Autoload**: A script Godot loads globally. This project uses an autoload for
  accessibility so every scene can announce messages the same way.
- **GDScript**: Godot's built-in scripting language.
- **Signal**: A message one part of the game can send to another.
