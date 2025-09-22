extends Label



func _process(_delta: float) -> void:
	#if ScoreVariables.gutterballs >= 15:
	#	$".".visible == true
	$".".text = "Gutts - " + str(ScoreVariables.gutterballs)
