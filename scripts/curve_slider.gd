extends HSlider


func _process(_delta: float) -> void:
	if ScoreVariables.curve_button_pressed == true:
		$".".visible = true

func _on_drag_ended(_value_changed: bool) -> void:
	ScoreVariables.curve_x = int(value)
	
