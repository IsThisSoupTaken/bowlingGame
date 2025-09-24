extends Area2D


# Checks to see if any pins were struck before the ball entered the gutter
# If none were, then the gutterball score goes up one
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Balls"):
		ScoreVariables.zooming = true
		if ScoreVariables.pin_struck == false:
			ScoreVariables.gutterballs += 1
