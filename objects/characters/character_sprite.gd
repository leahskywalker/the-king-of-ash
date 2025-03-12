# CharacterSprite.gd
extends Node2D

@onready var animated_sprite = $AnimatedSprite2D


func _ready() -> void:
	pass


# Creating Function for Potential Animated Sprites
func change_character(character_name : Character.Name, is_talking : bool = true):
	var sprite_frames = Character.CHARACTER_DETAILS[character_name]["sprite_frames"]
	
	# If New Speaker Has Sprite Frames, Switch to Talking Animation
	if sprite_frames:
		animated_sprite.sprite_frames = sprite_frames
		if is_talking:
			animated_sprite.play("talking") 
		else:
			animated_sprite.play("idle")
	
	# If Not, Display Idle Animation
	else:
		animated_sprite.play("idle")


func play_idle_animation():
	animated_sprite.play("idle")
