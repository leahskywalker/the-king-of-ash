# TextBlipSound.gd
extends AudioStreamPlayer

const sounds : Dictionary = {
	"male" : preload("res://assets/sounds/temp_blipmale.wav"),
	"female" :  preload("res://assets/sounds/temp_blipfemale.wav")
}

func play_sound(character_details: Dictionary):
	var character_gender = character_details["gender"]
	stream = sounds[character_gender]
	play()
