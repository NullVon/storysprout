# Architecture Notes

## Engine

Godot 4 Standard Edition.

## Language

GDScript.

## Input Philosophy

Use Godot Input Actions instead of hardcoding physical keys.

Example actions:
- move_up
- move_down
- move_left
- move_right
- interact
- cancel
- menu

This supports keyboard, controller, touch, Steam Deck, and future ports more cleanly.

## Repository Philosophy

StorySprout is a software project that contains a Godot project.

The Godot project lives inside:

`game/`

Documentation, art, audio, references, and tools live outside the Godot project folder.
