extends Node

class_name AccessibilityManager

signal announcement_made(message: String)

var speech_enabled := true
var voice_id := ""
var last_message := ""


func _ready() -> void:
	_pick_voice()


func announce(message: String, interrupt := true) -> void:
	var clean_message := message.strip_edges()
	if clean_message.is_empty():
		return

	last_message = clean_message
	announcement_made.emit(clean_message)
	print("[Accessibility] " + clean_message)

	if speech_enabled:
		_speak(clean_message, interrupt)


func repeat_last_announcement() -> void:
	if not last_message.is_empty():
		announce(last_message)


func set_speech_enabled(enabled: bool) -> void:
	speech_enabled = enabled
	if speech_enabled:
		announce("Speech enabled.")
	else:
		DisplayServer.tts_stop()
		print("[Accessibility] Speech disabled.")


func _pick_voice() -> void:
	var locale_voices := DisplayServer.tts_get_voices_for_language(OS.get_locale_language())
	if not locale_voices.is_empty():
		voice_id = locale_voices[0]
		return

	var voices := DisplayServer.tts_get_voices()
	if voices.is_empty():
		print("[Accessibility] No system text to speech voices were found.")
		return

	voice_id = str(voices[0].get("id", ""))


func _speak(message: String, interrupt := true) -> void:
	if voice_id.is_empty():
		return

	DisplayServer.tts_speak(message, voice_id, 50, 1.0, 1.0, 0, interrupt)
