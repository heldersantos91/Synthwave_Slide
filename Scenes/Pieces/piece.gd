tool
extends Area2D
class_name Piece

onready var game_manager = get_node("../..")
onready var select_sound: AudioStreamPlayer = get_node("piece_select")
onready var drag_sound: AudioStreamPlayer = get_node("piece_drag")

var selected: bool = false

export var id : int = 0
export(Texture) var asset setget set_texture, get_texture

func set_texture(value: Texture) -> void:
	$Sprite.texture = value
	
func get_texture() -> Texture:
	return $Sprite.texture

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		game_manager.selected_piece = self
		self.selected = true
		select_sound.play()
	elif event.is_action_released("click") and self.selected:
		drag_sound.play()
		self.selected = false
