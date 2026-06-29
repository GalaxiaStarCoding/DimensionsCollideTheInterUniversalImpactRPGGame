extends Node

class_name AccessibilityManager

signal announcement_made(message)

var last_announcement: String = ""

func _ready() -> void:
	# This node is intended to be autoloaded (Project Settings -> Autoload)
	# so other scripts can reference `AccessibilityManager` directly.
	pass

func announce(message: String) -> void:
	last_announcement = message
	emit_signal("announcement_made", message)
	# Also print to the debug console for visibility
	print("[AccessibilityManager] " + message)

func repeat_last_announcement() -> void:
	if last_announcement == "":
		announce("No messages to repeat.")
	else:
		announce(last_announcement)
