extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gd_arr = Array()
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	gd_arr.insert(0,preload("res://gd.png"))
	gd_arr.insert(1,preload("res://sprites/forest.png"))
	gd_arr.insert(2,preload("res://sprites/drip_gd.png"))
	var rand_gd_idx = rand_range(0,3)
	$gd1.set_texture(gd_arr[rand_gd_idx])
	$gd2.set_texture(gd_arr[rand_gd_idx])
	pass # Replace with function body.
