extends Node2D

var selected_piece : Piece = null
onready var spaces = get_tree().get_nodes_in_group("spaces") 
onready var v_player : VideoPlayer = $"VideoPlayer"
export(Resource) var next_level

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
	#correr o video
	get_tree().change_scene(next_level.get_path())    
	print("Level complete")

#func _process(delta):
##    if v_player.get_stream_position() == 1:
##        get_tree().change_scene(next_level.get_path())
