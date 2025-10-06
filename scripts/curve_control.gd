extends Control

signal button_pressed


func _on_curve_buy_button_pressed() -> void:
	button_pressed.emit()
