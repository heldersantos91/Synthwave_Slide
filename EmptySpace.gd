extends Area2D
class_name Space

export var id : int
onready var game_manager = get_node("../..")
var connected_piece : Piece = null

func _on_area_entered(area):
	connected_piece = area
	print("piece id: " + str(connected_piece.id) + " | " + str(id) + " :space id")
	game_manager.check_level_completion()
	
func _on_area_exited(area):
	connected_piece = null

func _on_mouse_entered():
	var piece_to_move = game_manager.selected_piece
	if connected_piece == null and piece_to_move != null:
		var dist_x = abs(piece_to_move.position.x - position.x)
		var dist_y = abs(piece_to_move.position.y - position.y)
		
		if floor(dist_x) == 0 or floor(dist_y) == 0:
			piece_to_move.position = position
			piece_to_move = null
