# Character.gd
class_name Character
extends Node


enum Name {
	STORYTELLER
}


const CHARACTER_DETAILS : Dictionary = {
	Name.STORYTELLER: {
		"name" : "Storyteller",
		"gender" : "female",
		"sprite_frames": preload("res://objects/characters/storyteller_sprites.tres")
	}
}


static func get_enum_from_string(string_value: String) -> int:
	var upper_string = string_value.to_upper()
	if Name.has(upper_string):
		return Name[upper_string]
	else:
		push_error("Invalid Character name: " + string_value)
		return - 1 # Or Any Other Value to Indicate
