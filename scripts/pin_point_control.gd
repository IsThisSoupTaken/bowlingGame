extends Control

const PIN_MULTI_MAX: int = 10

func _on_point_buy_button_pressed() -> void:
	if ScoreVariables.pin_multi <= PIN_MULTI_MAX:
		ScoreVariables.pin_multi += 1
		ScoreVariables.score -= $PointBuyButton.point_cost
		$PointBuyButton.point_cost = $PointBuyButton.point_cost * 2.5
