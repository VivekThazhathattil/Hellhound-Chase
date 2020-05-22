extends KinematicBody2D
var speed_x = 0
var speed_y = 0
var velocity = Vector2()
var init_y
const JUMP_FORCE = 600
var GRAVITY = 2000

func _ready():
	init_y = get_position().y
	$stickman.play("run")
	set_process(true)

func _process(delta):
	speed_y += GRAVITY * delta
	velocity.y = speed_y * delta
	var collision = move_and_collide(velocity)
	if collision and not get_node("/root/game").is_player_dead:
		$stickman.play("run")
		
func _input(event):
	if event.is_action_pressed("jump"):
		if not get_node("/root/game").is_player_dead:
			speed_y = -JUMP_FORCE
			$stickman.play("jump")
		else:
			get_tree().reload_current_scene()

