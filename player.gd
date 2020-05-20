extends KinematicBody2D
var speed_x = 0
var speed_y = 0
var velocity = Vector2()

const JUMP_FORCE = 600
const GRAVITY = 2000

func _ready():
	print(get_position())
	$stickman.play("run")
	set_process(true)

func _process(delta):
	speed_y += GRAVITY * delta
	velocity.y = speed_y * delta
	var collision = move_and_collide(velocity)
	if collision:
		$stickman.play("run")
	
func _input(event):
	if event.is_action_pressed("jump"):
		speed_y = -JUMP_FORCE
		$stickman.play("jump")
