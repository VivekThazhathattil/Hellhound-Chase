extends Node2D

var scroll_speed = 400
var active = true
var triggered = false

func _physics_process(delta):
	if active:
		position.x -= scroll_speed * delta
