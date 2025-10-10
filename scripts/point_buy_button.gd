extends Button

var point_cost: int = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if ScoreVariables.score >= 150:
		$".".visible = true
	$".".text = "Pins Worth More\n" + str(point_cost) + " pts"
