extends MarginContainer
func _ready():
	pass
func _process(_delta):
	pass

func _on_new_game_pressed():
	get_tree().change_scene("res://game.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_credits_pressed():
	get_tree().change_scene("res://scenes/credits.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_unlocks_pressed():
	pass # Replace with function body.
