extends Sprite
var tex_arr = Array()
		
func _ready():
	tex_arr.insert(0, preload("res://sprites/trees/tree1.png"))
	tex_arr.insert(1, preload("res://sprites/trees/tree2.png"))
	tex_arr.insert(2, preload("res://sprites/trees/tree3.png"))
	tex_arr.insert(3, preload("res://sprites/trees/tree4.png"))
				
func _process(_delta):
	if int(get_node("/root/game").time) % 5 == 0:
			get_node("/root/game/trees").set_texture(tex_arr[rand_range(0,4)])
	
