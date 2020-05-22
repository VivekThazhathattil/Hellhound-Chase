extends Area2D
var vel
var spin
var pos
var active = true
var time
var ampl

func _ready():
	randomize()
	time = 0
	vel = Vector2(rand_range(-1000, -500), 0)
	ampl = rand_range(-400,100)
	vel.y = 0
	spin = rand_range(-PI, PI)
	pos = Vector2(1316,330)
	$missile_body.play("stable")
	set_process(true)
	
func _process(delta):
	time += delta
	if vel.y == 0:
		ampl = rand_range(-800,100)
	vel.y = ampl*sin(time*5)
	set_rotation(get_rotation() + spin * delta)
	pos += vel * delta
	set_position(pos)

func _on_missile_body_entered(body):
	$missile_body.play("explosion")
	get_node("/root/game/player/stickman").play("explode")
	get_node("/root/game/player").GRAVITY = 300
	get_node("/root/game/player").speed_y = -get_node("/root/game/player").JUMP_FORCE/2
	$trail.queue_free()
	get_node("/root/game").is_player_dead = true
	yield(get_node("/root/game/player/stickman"), "animation_finished")
	get_node("/root/game/player").queue_free()



func _on_VisibilityNotifier2D_viewport_exited(viewport):
	get_node(".").queue_free()