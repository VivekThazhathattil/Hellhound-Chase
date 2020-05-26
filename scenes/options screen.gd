extends Node2D

var fog_visible = false
var particle_visible = true
var trail_visible = true
var sounds_audible = true

func _ready():
	print(self.get_path())
	pass # Replace with function body.

func _on_go_back_pressed():
	if 	get_tree().change_scene("res://scenes/main_screen.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the scene")

func _on_missile_trail_toggle_toggled(button_pressed):
	trail_visible = not trail_visible

func _on_hellhound_trail_toggle_toggled(button_pressed):
	particle_visible = not particle_visible

func _on_fog_toggled(button_pressed):
	fog_visible = not fog_visible


func _on_sound_toggled(button_pressed):
	sounds_audible = not sounds_audible
