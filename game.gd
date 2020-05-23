extends Node2D
var screen_size : Vector2 = Vector2()
var time
var missile
var count = 0
var progress_no = 0.5
var is_player_dead = false
onready var s = load("res://scenes/missile.tscn")
onready var h = load("res://scenes/hud.tscn")
var scorebox
var dodge_bonus = 0
var tot_score = 0

func _ready():
	scorebox = h.instance()
	add_child(scorebox)
	scorebox.show()
	screen_size = OS.get_screen_size()
	time = 0
	get_node("reload_button").visible = false
	set_process(true)
	
func _process(delta):
	time += delta

	if time > count*2:
		count += 1 - 0.005*count
		missile = s.instance()
		add_child(missile)
	if is_player_dead == true:
		_player_death_event()
	else:
			tot_score += delta*100
			scorebox.update_score(tot_score)
			
func _player_death_event():
		get_node("reload_button").visible = true
		$sky/sky1.VELOCITY = 0
		$sky/sky2.VELOCITY = 0
		$gd/gd1.VELOCITY = 0
		$gd/gd2.VELOCITY = 0
		$bg_new/bg_new1.VELOCITY = 0
		$bg_new/bg_new2.VELOCITY = 0
