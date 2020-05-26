extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_pause_button_pressed():
		get_tree().paused = not get_tree().paused
		if get_tree().paused:
			$pause_button.text = "Unpause"
		else:
			$pause_button.text = "Pause"
		
func _on_back_button_pressed():
	get_parent().queue_free()
	if 	get_tree().change_scene("res://scenes/main_screen.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the scene")
