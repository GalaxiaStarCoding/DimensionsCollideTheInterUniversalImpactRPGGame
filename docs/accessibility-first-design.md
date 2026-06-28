# Accessibility-First Design

Dimensions Collide should be playable by blind players from the start, not after
the game is mostly finished.

## Current accessibility foundation

The project has a global `AccessibilityManager` autoload. Gameplay code should use
it whenever the player needs information:

```gdscript
AccessibilityManager.announce("Door opened.")
```

The manager currently does two things:

- Speaks the message through Godot text to speech when a system voice is
  available.
- Prints the same message to Godot's Output panel and the on-screen status label.

Godot's built-in text-to-speech API requires
`ProjectSettings.audio/general/text_to_speech` to be enabled. This project enables
that setting in `project.godot`.

## What must be announced

Announce information when it affects play:

- Current location.
- Nearby interactable objects.
- Menu focus changes.
- Combat turns, targets, damage, misses, and status effects.
- Inventory changes.
- Quest updates.
- Errors, blocked paths, and invalid actions.

Do not rely on visuals alone for any required information.

## Input rules

Keep keyboard play complete before adding mouse-only interactions.

- Every menu must work with arrow keys, Enter, Escape, and a repeat/help key.
- Every important message should be repeatable.
- Avoid timed choices unless there is an option to disable or extend the timer.
- Avoid inputs that require holding several keys at once.

## Audio rules

Audio should help the player understand the world.

- Use speech for exact information.
- Use sound effects for spatial hints, confirmations, danger, and atmosphere.
- Do not use sound effects as the only way to communicate exact numbers or menu
  choices.
- Keep music quieter than speech by default.

## Screen reader note

NVDA and JAWS will not automatically understand a custom game canvas the same way
they understand a web page or document. The game needs its own spoken output,
keyboard navigation, and audio cues. Godot text to speech is the first layer of
that system.

## If speech does not work

Check these first:

1. Make sure text to speech is enabled in Godot under **Project Settings**,
   **Audio**, **General**, **Text to Speech**.
2. Restart Godot after changing that setting.
3. Make sure the operating system has at least one installed voice.
4. Check Godot's Output panel. If messages appear there, the game is announcing
   correctly and the issue is likely the system speech setup.

## Accessibility definition of done

A feature is not done until:

- It can be completed with the keyboard.
- All required visual information is also available through speech or audio.
- The player can repeat important information.
- The feature has been tested without looking at the screen.
- The docs are updated if the feature adds a new control or pattern.
