extends Label

# Displays the gutterball score. Only displays after 10 total.
func _process(_delta: float) -> void:
	$".".visible = false
	if ScoreVariables.gutterballs >= 10:
		$".".visible = true
	$".".text = "Gutts - " + str(ScoreVariables.gutterballs)
