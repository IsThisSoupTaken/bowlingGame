extends RigidBody2D

@onready var pin_sound = %PinCollisionSound

# Plays the bowling pin sound effect
# Courtesy of Rvgerxini @ freesound.org
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Pins") or body.is_in_group("Balls"):
		pin_sound.play()
		if body.is_in_group("Balls"):
			ScoreVariables.pin_struck = true
