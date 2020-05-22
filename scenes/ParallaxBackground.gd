extends ParallaxBackground
export var scrollspeed = Vector2(-10,0)
func _ready():
	var viewportWidth = get_viewport().size.x
	var viewportHeight = get_viewport().size.y
	var scale = viewportWidth / get_node("ParallaxLayer/Sprite").texture.get_size().x
	#get_node("ParallaxLayer/Sprite").set_position(Vector2(viewportWidth/2, viewportHeight/2))
	get_node("ParallaxLayer/Sprite").set_scale(Vector2(scale, scale))
	var desired_size = get_node("ParallaxLayer/Sprite").texture.get_size().rotated(get_node("ParallaxLayer/Sprite").global_rotation)
	get_node("ParallaxLayer").motion_mirroring = Vector2(desired_size.x /1.407, desired_size.y)
	set_process(true)
	
func _process(_delta):
	get_node(".").scroll_offset += scrollspeed
