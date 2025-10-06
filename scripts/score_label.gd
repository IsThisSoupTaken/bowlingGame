extends Label

func _process(_delta: float) -> void:
	$".".text = "Points\n------\n" + str(ScoreVariables.score)
