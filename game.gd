extends Node2D
var screen_size : Vector2 = Vector2()
var time
var missile
var count = 0
var progress_no = 0.5
var is_player_dead = false
var is_chaser_dead = false
var level = 1
onready var s = load("res://scenes/missile.tscn")
onready var h = load("res://scenes/hud.tscn")
onready var t = load("res://trees.tscn")
onready var i = load("res://special_item.tscn")
var new_tree
var scorebox
var dodge_bonus = 0
var tot_score = 0
var item_count = 0
const max_levels = 100

func _ready():
	$second_menu.visible = false
	scorebox = h.instance()
	add_child(scorebox)
	scorebox.show()
	scorebox.update_level(level)
	screen_size = OS.get_screen_size()
	time = 0
	_update_wait_times()
	set_process(true)

func _process(delta):
	time += delta
## missile spawn
#	if time > count*(float(max_levels)/10 - float(level)/10) and not is_player_dead:
#		count += 1 - 0.05*count
#		missile = s.instance()
#		add_child(missile)
## item spawn
#	if int(time+1) % 4 ==0 and item_count == 0 and not is_player_dead:
#		var new_item = i.instance()
#		add_child(new_item)
#		item_count += 1
		
	if is_player_dead:
		_player_death_event()
	elif is_chaser_dead:
		$chaser_area._chaser_death_event()
		scorebox.update_level(level)
	else:
			tot_score += level
			scorebox.update_score(tot_score)

func _player_death_event():
		$second_menu.visible = true
		get_node("/root/game/chaser_area/chaser").play("idle")
		$sky/sky1.VELOCITY = 0
		$sky/sky2.VELOCITY = 0
		$gd/gd1.VELOCITY = 0
		$gd/gd2.VELOCITY = 0
		$bg_new/bg_new1.VELOCITY = 0
		$bg_new/bg_new2.VELOCITY = 0
		$timer_for_missile.paused = true
		$timer_for_spec_item.paused = true

func _update_wait_times():
	$timer_for_missile.wait_time = 3*(float(max_levels-level)/max_levels)
	$timer_for_spec_item.wait_time = 5*(float(max_levels-level)/max_levels)

func _on_timer_for_spec_item_timeout():
	var new_item = i.instance()
	add_child(new_item)
	item_count += 1

func _on_timer_for_missile_timeout():
	missile = s.instance()
	add_child(missile)

func _modulate_colors():
	$bg_new.modulate = lerp( get_modulate(), Color(randf(),randf(),randf()), 0.2)
	$sky.modulate = lerp( get_modulate(), Color(randf(),randf(),randf()), 0.2)
