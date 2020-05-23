extends Line2D
var target
var point
var new_gradient
export(NodePath) var targetPath
export var trailLength = 0
func _ready():
	randomize()
#	new_gradient = Gradient.new([Color(255, 128, 128), Color(128, 128, 255, 255)])
#	set_gradient(new_gradient)
	target = get_node(targetPath)
	pass
func _process(_delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	point = target.global_position
	add_point(point)
	while get_point_count() > trailLength:
		remove_point(0)
	pass
