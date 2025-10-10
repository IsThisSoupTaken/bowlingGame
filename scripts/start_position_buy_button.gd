extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if ScoreVariables.score >= 300 and ScoreVariables.start_pos_bought == false:
		$".".visible = true
	elif ScoreVariables.start_pos_bought == true:
		$".".visible = false
