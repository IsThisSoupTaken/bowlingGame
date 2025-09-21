extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Balls"):
		ScoreVariables.zooming = true
		if ScoreVariables.pin_struck == false:
			ScoreVariables.gutterballs += 1
