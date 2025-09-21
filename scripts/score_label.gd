extends Label


func _process(_delta: float) -> void:
	$".".text = "Points - " + str(ScoreVariables.score)
