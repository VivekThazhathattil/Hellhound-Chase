extends CanvasLayer

func hide():
	$ScoreBox.hide()

func show():
	$ScoreBox.show()

func update_score(value):
	$ScoreBox/Score.text = str(int(value))

func update_level(value):
	$level_no_info/level_no.text = str(value)
