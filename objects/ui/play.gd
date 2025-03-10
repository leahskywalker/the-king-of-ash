extends Button

func _ready() -> void:
	%Play.pressed.connect(play)

func play():
	get_tree().change_scene_to_file("res://objects/scenes/scene_one.tscn")
