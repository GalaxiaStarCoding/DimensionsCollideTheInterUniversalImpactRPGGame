extends Node2D

const CELL_SIZE := 64
const GRID_ORIGIN := Vector2(160, 80)
const GRID_WIDTH := 5
const GRID_HEIGHT := 4
const TILE_DESCRIPTIONS := {
	"2,2": "the training room center. The air hums like two worlds are overlapping.",
	"2,1": "a cracked portal marker. It is quiet, but it feels important.",
	"1,2": "a supply crate. It is empty for now.",
	"3,2": "a practice target. Later this can become the first combat lesson.",
	"2,3": "the exit path. It is blocked until the first quest is designed."
}

var player_cell := Vector2i(2, 2)

@onready var player_marker: ColorRect = $Player
@onready var status_label: Label = $Hud/StatusLabel


func _ready() -> void:
	AccessibilityManager.announcement_made.connect(_on_announcement_made)
	_sync_player_visual()
	announce_current_location("Dimensions Collide prototype loaded. ")


func _unhandled_input(event: InputEvent) -> void:
	if not (event is InputEventKey):
		return

	if not event.pressed or event.echo:
		return

	match event.keycode:
		KEY_UP:
			_try_move(Vector2i.UP)
		KEY_DOWN:
			_try_move(Vector2i.DOWN)
		KEY_LEFT:
			_try_move(Vector2i.LEFT)
		KEY_RIGHT:
			_try_move(Vector2i.RIGHT)
		KEY_ENTER, KEY_SPACE:
			_inspect_current_tile()
		KEY_H:
			AccessibilityManager.announce(_help_text())
		KEY_R:
			AccessibilityManager.repeat_last_announcement()
		KEY_ESCAPE:
			get_tree().quit()


func announce_current_location(prefix := "") -> void:
	AccessibilityManager.announce(prefix + _current_location_text())


func _try_move(direction: Vector2i) -> void:
	var next_cell := player_cell + direction
	if not _cell_is_inside_room(next_cell):
		AccessibilityManager.announce("Wall. " + _short_position_text())
		return

	player_cell = next_cell
	_sync_player_visual()
	announce_current_location()


func _inspect_current_tile() -> void:
	AccessibilityManager.announce("Inspecting. " + _current_location_text())


func _sync_player_visual() -> void:
	player_marker.position = GRID_ORIGIN + Vector2(player_cell.x, player_cell.y) * CELL_SIZE + Vector2(12, 12)
	player_marker.size = Vector2(40, 40)


func _current_location_text() -> String:
	var description: String = TILE_DESCRIPTIONS.get(_cell_key(player_cell), "an empty part of the room.")
	return _short_position_text() + " You are at " + description


func _short_position_text() -> String:
	return "Column %d, row %d." % [player_cell.x + 1, player_cell.y + 1]


func _cell_key(cell: Vector2i) -> String:
	return "%d,%d" % [cell.x, cell.y]


func _cell_is_inside_room(cell: Vector2i) -> bool:
	return cell.x >= 0 and cell.x < GRID_WIDTH and cell.y >= 0 and cell.y < GRID_HEIGHT


func _help_text() -> String:
	return "Help. Use arrow keys to move. Press Space or Enter to inspect your current tile. Press R to repeat the last message. Press Escape to quit."


func _on_announcement_made(message: String) -> void:
	status_label.text = message
