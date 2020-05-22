extends ParallaxBackground
export var scrollspeed = Vector2(-10,0)
func _ready():
	pass
func _process(_delta):
	if get_node(".").scroll_offset.x <= -get_viewport().size.x:
		get_node(".").scroll_offset = Vector2(0,0)
	else:
		print(get_node(".").scroll_offset)
		get_node(".").scroll_offset += scrollspeed
