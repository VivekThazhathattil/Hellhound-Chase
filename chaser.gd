extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if get_parent().is_player_dead == false:
		position.x += get_parent().time*0.03
	if int(position.x) >= int(get_node("/root/game/player").position.x - 10):
		get_node("/root/game/player/stickman").play("blood_burst")
		get_parent().is_player_dead = true
		yield(get_node("/root/game/player/stickman"), "animation_finished")
		get_node("/root/game/player").visible = false
