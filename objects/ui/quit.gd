extends Button

func _ready() -> void:
	%Quit.pressed.connect(press)

func press():
	get_tree().quit()
