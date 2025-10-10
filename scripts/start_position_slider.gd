extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	ScoreVariables.start_x = $".".value


func _on_start_position_buy_button_pressed() -> void:
	$"../StartPositionBuyButton".visible = false
	$".".visible = true
	ScoreVariables.start_pos_bought = true
