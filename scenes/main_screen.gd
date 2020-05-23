extends CenterContainer
onready var s = load("res://game.tscn")
func _ready():
	pass 

func _on_continue_button_pressed():
	pass # Replace with function body.


func _on_new_game_button_pressed():
	var new_game = s.instance()
	add_child(new_game)


func _on_options_button_pressed():
	pass # Replace with function body.
