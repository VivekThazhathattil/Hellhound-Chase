extends AudioStreamPlayer2D
var song1
func _ready():
	song1 = load("audio/driving_in_the_rain1.wav")
	self.set_stream(song1)
	self.play()
	
func _process(_delta):
	if get_node("/root/game").is_player_dead == true:
		self.playing = false
