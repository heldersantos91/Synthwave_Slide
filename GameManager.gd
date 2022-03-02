extends Node2D

var selected_piece : Piece = null
onready var spaces = get_tree().get_nodes_in_group("spaces") 

func _input(event):
	if event.is_action_released("click"):
		selected_piece = null

func check_level_completion():
	for s in spaces:
		var space = s as Space
		if space.connected_piece == null:
			continue
		if space.id != space.connected_piece.id:
			return

	#victory
	print("Level complete")
