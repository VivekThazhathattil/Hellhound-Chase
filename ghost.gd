extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var c
# Called when the node enters the scene tree for the first time.
func _ready():
	c = get_node("/root/game/missile").mis_col
	$alpha_tween.interpolate_property(self, "modulate", Color(c.r,c.g,c.b,1), Color(c.r,c.g,c.b,0), 0.3, Tween.TRANS_SINE, Tween.EASE_OUT)
	$alpha_tween.start()

func _on_alpha_tween_tween_completed(object, key):
	queue_free()
