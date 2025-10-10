extends Label

func _ready() -> void:
	$".".visible = false

# Displays the gutterball score. Only displays after 5 total.
func _process(_delta: float) -> void:
	if ScoreVariables.gutterballs >= 5:
		$".".visible = true
	$".".text = "G-Balls\n-------\n" + str(ScoreVariables.gutterballs)
