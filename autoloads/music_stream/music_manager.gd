#music_manager.gd
extends Node

@export var interactive_music: AudioStreamPlayer
@export var music_stream: AudioStreamInteractive

var clip_index = 5
var last_index = 1


func _ready():
	#connect the time signal here (0.0f to 1.0f)
	#DayAndNightCycleManager.game_day_progression.connect(update_time)
	
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
	
	#match day_period:
		#3:#evening
			#clip_index = 4
		#2:#day
			#clip_index = 3
		#1:#morning
			#clip_index = 0
		#0:#adapt the night music for darkness
			#if PlayerData.in_dark:
				#clip_index = 1
				##print("in dark")
			#else:
				#clip_index = 5
		#_:
			#clip_index = 3
		#
	#print("clip index : "+str(clip_index))

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
