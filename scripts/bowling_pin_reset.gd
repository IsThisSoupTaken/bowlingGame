extends Marker2D

@onready var pin = preload("res://scenes/bowling_pin.tscn")

# When the Reset times out, check if the pin is in its original position.
func _on_reset_timer_timeout() -> void:
	if get_child_count() == 1:
		var missed_pin = get_child(0)
		if missed_pin.position != Vector2.ZERO:
			missed_pin.queue_free()
	%SetupTimer.start()
