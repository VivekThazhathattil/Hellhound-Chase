extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sky_arr = Array()
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	sky_arr.insert(0,preload("res://sky.png"))
	sky_arr.insert(1,preload("res://sprites/sky_2.png"))
	sky_arr.insert(2,preload("res://sprites/dusky_sky.png"))
	var rand_bg_idx = rand_range(0,3)
	$sky1.set_texture(sky_arr[rand_bg_idx])
	$sky2.set_texture(sky_arr[rand_bg_idx])
	pass # Replace with function body.
