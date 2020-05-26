extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	position.y = rand_range(200,360)
	position.x = 1300
	$special_item_sprite.play("idle")
func _process(delta):
	position.x -= delta*(600 + 5*get_parent().level)

func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	self.queue_free()
	get_node("/root/game").item_count = 0

func _on_special_item_body_entered(_body):
	modulate = Color(randf(),randf(),randf(),1)
	$special_item_sprite.play("taken")
	#get_node("/root/game/chaser_area").position.x = 0
	get_node("/root/game").is_chaser_dead = true
