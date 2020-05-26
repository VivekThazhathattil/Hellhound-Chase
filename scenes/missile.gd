extends Area2D
var vel
var spin
var pos
var active = true
var time
var ampl
var fix_y
var mis_col
func _ready():
	randomize()
	time = 0
	vel = Vector2(rand_range(-1000, -500), 0)
	ampl = rand_range(-800,100)
	spin = rand_range(-PI, PI)
	pos = Vector2(1316,rand_range(370,390))
	mis_col = Color(randf(),randf(),randf())
	modulate = mis_col
	$missile_body.play("stable")
	set_process(true)
	
func _process(delta):
	time += delta
	if vel.y == 0:
		ampl = rand_range(-800,100)
	vel.y = ampl*sin(time*5)
	set_rotation(atan2(vel.y, vel.x))
	pos += vel * delta
#	if abs(pos.y - get_node("/root/game/player").init_y) < 10 and not get_node("/root/game").is_player_dead:
#		get_node("/root/game").dodge_bonus += 100
#		get_node("/root/game").tot_score += get_node("/root/game").dodge_bonus
#		get_node("/root/game/hud").update_score(get_node("/root/game").tot_score)
		#print message dodge bonus (TODO)
	set_position(pos)

func _on_missile_body_entered(body):
	$missile_body.play("explosion")
	$trail.visible = false
	if body == get_node("/root/game/player"):
		get_node("/root/game/player/stickman").play("explode")
		get_node("/root/game/player").GRAVITY = 300
		get_node("/root/game/player").speed_y = -get_node("/root/game/player").JUMP_FORCE/2
		get_node("/root/game").is_player_dead = true
		yield(get_node("/root/game/player/stickman"), "animation_finished")
		get_node("/root/game/player").queue_free()

func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	get_node(".").queue_free()


func _on_ghost_timer_timeout():
	var this_ghost = preload("res://ghost.tscn").instance()
	get_parent().add_child(this_ghost)
	this_ghost.position = position
	this_ghost.texture = $missile_body.frames.get_frame($missile_body.animation,$missile_body.frame)
	this_ghost.flip_h = true
