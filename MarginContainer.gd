extends Node

func _ready():
	pass # Replace with function body.

func _on_restart_pressed():
	get_parent().queue_free()
	get_tree().reload_current_scene()


func _on_return2menu_pressed():
	get_parent().queue_free()
	get_tree().change_scene("res://scenes/main_screen.tscn")



func _on_exit_pressed():
	get_parent().queue_free()
	get_tree().quit()
