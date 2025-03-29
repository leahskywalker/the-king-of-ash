#music_manager.gd
extends Node

@export var interactive_music: AudioStreamPlayer
@export var music_stream: AudioStreamInteractive

var clip_index: int = 0
var last_index: int = 1

@export var scene: int = 0

func _ready():
	
	#interactive_music must already be instantiated and is referred here
	interactive_music = $music
	music_stream = interactive_music.stream

	if interactive_music and music_stream:
		interactive_music.play()
	
func choose_music_clip():
	if not interactive_music.playing:
		return
	
	var clip_count = music_stream.get_clip_count()
	if clip_count == 0:
		return
		
	last_index = clip_index
	
	match scene:
		0:#intro
			clip_index = 0
		1:#scene_2
			clip_index = 1
		2:#scene3
			clip_index = 2
		3:#scene4_start
			clip_index = 3
		4:#scene4_2
			clip_index = 4
		5:#scene4_3
			clip_index = 5
		6:#scene5
			clip_index = 6
		7:#scene6
			clip_index = 7
		_:
			clip_index = 0
		
	print("clip index : "+str(clip_index))

	if last_index != clip_index:
		switch_clip(clip_index)


func _process(_delta):
	if interactive_music and music_stream:
		choose_music_clip()
		

func switch_clip(index):
	interactive_music.get_stream_playback().switch_to_clip(index)
	
func get_clip_length(clip_index: int) -> float:
	var clip_length = music_stream.get_clip_stream(clip_index).get_length()
	#print("clip_lenght : "+str(clip_length))
	return max(clip_length,5.0)  # Return duration in real seconds or default value
