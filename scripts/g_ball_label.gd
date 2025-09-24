extends Label


func _process(_delta: float) -> void:
	$".".visible = false
	if ScoreVariables.gutterballs >= 15:
		$".".visible = true
	$".".text = "Gutts - " + str(ScoreVariables.gutterballs)
