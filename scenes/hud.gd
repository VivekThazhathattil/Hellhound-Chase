extends CanvasLayer

func hide():
	$ScoreBox.hide()

func show():
	$ScoreBox.show()

func update_score(value):
	$ScoreBox/HBoxContainer/Score.text = str(int(value))
