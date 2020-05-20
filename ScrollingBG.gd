extends Node

export(float) var scroll_speed = 0.4
func _ready():
	self.material.set_shader_param("scroll_speed", scroll_speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("Left button was clicked at ", event.position)
