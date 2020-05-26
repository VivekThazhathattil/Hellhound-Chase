extends MarginContainer

func _ready():
	print(self.get_path())
	preload("res://game.tscn")
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
	get_tree().change_scene("res://scenes/options screen.tscn")


func _on_unlocks_pressed():
	get_tree().change_scene("res://scenes/unlock_screen.tscn")


func _on_new_game_mouse_entered():
	$button_press_sound.play()


func _on_unlocks_mouse_entered():
	$button_press_sound.play()


func _on_options_mouse_entered():
	$button_press_sound.play()


func _on_credits_mouse_entered():
	$button_press_sound.play()


func _on_exit_mouse_entered():
	$button_press_sound.play()
