tool
extends Area2D
class_name Piece

onready var game_manager = get_node("../..")
export var id : int = 0
export(Texture) var asset setget set_texture, get_texture

func set_texture(value: Texture) -> void:
	$Sprite.texture = value
	
func get_texture() -> Texture:
	return $Sprite.texture

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		game_manager.selected_piece = self
