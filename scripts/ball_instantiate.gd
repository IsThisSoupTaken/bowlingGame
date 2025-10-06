extends Node2D

const CURVE_BUY_COST: int = 10

@onready var ball: PackedScene = preload("res://scenes/bowling_ball.tscn")
var ball_amt: int = 0

signal ball_gone


func add_ball():
	ball_amt += 1
	ScoreVariables.pin_struck = false
	var new_ball = ball.instantiate()
	new_ball.global_position = Vector2(randf_range(375, 580), randf_range(1075, 1200))
	new_ball.tree_exiting.connect(func(): ball_amt -= 1)
	add_child(new_ball)


func _on_ball_catcher_body_exited(body: Node2D) -> void:
		if body.is_in_group("Balls") or body.is_in_group("Pins"):
			body.queue_free()
			if body.is_in_group("Balls"):
				%ResetTimer.start()
				ScoreVariables.zooming = false
				emit_signal("ball_gone")


func _on_button_pressed() -> void:
	if ball_amt == 0 and %ResetTimer.is_stopped() and %SetupTimer.is_stopped():
		add_ball()
		ScoreVariables.bowl_count += 1
		%BowlButton.disabled = true



func _on_curve_control_button_pressed() -> void:
	if ScoreVariables.gutterballs < CURVE_BUY_COST:
		return
	elif ScoreVariables.gutterballs >= CURVE_BUY_COST:
		$CurveControl/CurveBuyButton.visible = false
		$CurveControl/CurveSlider.visible = true
		ScoreVariables.curve_button_pressed = true
		ScoreVariables.gutterballs -= CURVE_BUY_COST
