extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func _on_begin_button_pressed():
	$button_press_sound.play()
	get_tree().change_scene("res://scenes/main_screen.tscn")




func _on_begin_button_mouse_entered():
	$button_press_sound.play()
