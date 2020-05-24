extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var level_update_flag = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(randf(),randf(),randf(),1)

func _process(delta):
	if not get_parent().is_player_dead and not get_parent().is_chaser_dead:
		position.x += delta * (40 + float(get_parent().level)/2)
	else:
		position.x -= 2

func _on_chaser_area_body_entered(body):
	if body == get_node("/root/game/player"):
		get_node("/root/game/player/stickman").play("blood_burst")
		get_parent().is_player_dead = true
		yield(get_node("/root/game/player/stickman"), "animation_finished")
		position.x = 0
		get_node("/root/game/player").visible = false		
	else:
		pass

func _chaser_death_event():
	$chaser.play("deteriorate")
	position.x -= 10
	if get_node("/root/game").level < 100 and level_update_flag == 0:
		print(get_parent().level)
		get_parent().level += 1
		level_update_flag = 1
	yield($chaser,"animation_finished")
	position.x = -100
	level_update_flag = 0
	get_parent().is_chaser_dead = false
	$chaser.play("run")
