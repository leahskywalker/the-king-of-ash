# TextBlipSound.gd
extends AudioStreamPlayer

func _ready():
	set_bus("SFX")

const SOUNDS : Dictionary = {
	"male" : preload("res://assets/sounds/temp_blipmale.wav"),
	"female" :  preload("res://assets/sounds/temp_blipfemale.wav")
}

func play_sound(character_details: Dictionary):
	var character_gender = character_details["gender"]
	stream = SOUNDS[character_gender]
	play()
