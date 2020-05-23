extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	position.y = rand_range(100,360)
	position.x = 1300
	$special_item_sprite.play("idle")
func _process(delta):
	position.x -= delta*600

func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	self.queue_free()
	get_node("/root/game").item_count = 0



func _on_special_item_body_entered(_body):
	$special_item_sprite.play("taken")
	get_node("/root/game/chaser").position.x = 0
