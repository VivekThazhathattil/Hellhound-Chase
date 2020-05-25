extends Node2D

var bg_arr = Array()
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	bg_arr.insert(0,preload("res://sprites/mountains.png"))
	bg_arr.insert(1,preload("res://bg_new.png"))
	bg_arr.insert(2,preload("res://sprites/snowy_mountains.png"))
	bg_arr.insert(3,preload("res://sprites/null.png"))
	var rand_bg_idx = rand_range(0,4)
	$bg_new1.set_texture(bg_arr[rand_bg_idx])
	$bg_new2.set_texture(bg_arr[rand_bg_idx])
	modulate = Color(randf(),randf(),randf())
