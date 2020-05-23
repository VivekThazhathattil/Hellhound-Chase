extends MarginContainer
func _ready():
	pass 
func _process(_delta):
	pass


func _on_new_game_pressed():
	get_tree().change_scene("res://game.tscn")
