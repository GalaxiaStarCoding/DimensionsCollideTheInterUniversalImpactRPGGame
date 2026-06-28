# Development Plan

This is a practical order for building the game without getting overwhelmed.

## Phase 1: Foundation

Goal: prove the project can run and speak useful game information.

- Keep the main scene small.
- Add movement one step at a time.
- Add a repeat-last-message command.
- Add a help command.
- Test with the screen off or covered.

Done when a player can move around a small room and understand where they are.

## Phase 2: Exploration prototype

Goal: make one room feel like a real RPG space.

- Add named exits.
- Add one interactable object.
- Add one non-player character.
- Add a simple dialogue box that speaks the focused line.
- Add a command that lists nearby objects.

Done when a blind player can find and use the room's important object without
help.

## Phase 3: Menus

Goal: create reusable accessible menus before combat or inventory grows.

- Main menu.
- Inventory menu.
- Settings menu.
- Speech volume/rate settings.
- Save/load menu.

Done when every menu item is reachable by keyboard and announced on focus.

## Phase 4: Combat prototype

Goal: build one small battle that is understandable without visuals.

- Turn announcement.
- Target selection.
- Attack result announcement.
- Health/status announcement.
- Victory and defeat states.

Done when the battle can be won without looking at the screen.

## Phase 5: Content pipeline

Goal: make it easy to add story content without rewriting code.

- Decide how maps, dialogue, enemies, and items are stored.
- Keep names and descriptions close to the data.
- Require accessible descriptions for every important object.
- Document the format with examples.

Done when adding a simple room does not require changing core systems.

## Before adding a feature

Write down:

- What the player is trying to do.
- What information the player needs.
- How the player hears that information.
- Which keys are used.
- How the feature will be tested without sight.

If those answers are unclear, design the feature a little more before coding.
