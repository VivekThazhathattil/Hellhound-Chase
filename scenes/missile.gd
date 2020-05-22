extends RigidBody2D
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
	pos = Vector2(1316,192)
	set_process(true)
	
func _process(delta):
	time += delta
	if vel.y == 0:
		ampl = rand_range(-800,100)
	vel.y = ampl*sin(time*5)
	set_rotation(get_rotation() + spin * delta)
	pos += vel * delta
	set_position(pos)
