# Dimensions Collide

Dimensions Collide is a from-scratch Godot remake of an RPG that was first
prototyped in RPG Maker MV. The remake exists so accessibility can be designed
into the game from the beginning, especially for blind players using screen
readers such as NVDA and JAWS.

## Current status

This repository now contains a small Godot 4 starter project:

- A main scene that can be opened and run in Godot.
- A tiny keyboard-driven prototype room.
- A global accessibility manager for spoken announcements.
- Beginner docs for learning the project without needing prior Godot experience.

The first goal is not to build the whole RPG at once. The first goal is to make
sure every new gameplay idea has an accessible way to be understood and played.

## Quick start

1. Install Godot 4 from the official Godot website.
2. Open Godot and choose **Import**.
3. Select this repository's `project.godot` file.
4. Press **Run Project**.
5. Use the arrow keys to move, **Space** or **Enter** to inspect, **H** for help,
   and **Escape** to quit.

If speech is not heard, check `docs/accessibility-first-design.md` for the first
things to verify.

## Documentation

- `docs/getting-started-with-godot.md` explains the editor and project layout.
- `docs/accessibility-first-design.md` explains the accessibility approach.
- `docs/development-plan.md` gives a practical next-step roadmap.
