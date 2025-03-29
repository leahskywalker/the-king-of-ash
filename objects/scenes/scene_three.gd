#SceneThree.gd
extends Node2D

@onready var character_sprite : Node2D = %CharacterSprite
@onready var dialog_ui : Control = %DialogUI
@onready var next_sentence_sound = $NextSentenceSound

var dialog_index : int = 0

const dialog_lines : Array[String] = [
	"Storyteller:With Avernus at his feet, he turned his gaze to the mortal realm.",
	"Storyteller:He would conquer this world just as he did the last and the legendary city of Myth Drannor would be his first prize.",
	"Storyteller:The people of Faerûn could only watch in horror as their nightmare began."
	]


func _ready():
	# Connect Signals
	dialog_ui.text_animation_done.connect(_on_text_animation_done)
	# Process First Line of Dialog
	dialog_index = 0
	process_current_line()


func _input(event):
	if event.is_action_pressed("next_line"):
		if dialog_ui.animate_text:
			dialog_ui.skip_text_animation()
		else:
			if dialog_index < len(dialog_lines) - 1:
				dialog_index += 1
				next_sentence_sound.play()
				process_current_line()
			else:
				transition_to_next_scene()


func parse_line(line: String):
	var line_info = line.split(":")
	assert(len(line_info) >= 2)
	return {
		"speaker_name" : line_info[0],
		"dialog_line" : line_info[1]
	}


func process_current_line():
	var line = dialog_lines[dialog_index]
	var line_info = parse_line(line)
	var character_name = Character.get_enum_from_string(line_info["speaker_name"])
	dialog_ui.change_line(character_name, line_info["dialog_line"])
	character_sprite.change_character(character_name)


func _on_text_animation_done():
	character_sprite.play_idle_animation()


func transition_to_next_scene():
		var scene_two = load("res://objects/scenes/scene_four.tscn")
		if scene_two:
			get_tree().change_scene_to_packed(scene_two)
		else:
			print("Error: Scene Two not found!")
