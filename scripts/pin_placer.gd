extends Node

var all_clear = false

@onready var pin = preload("res://scenes/bowling_pin.tscn")

func _ready() -> void:
	add_start_pins()

func pin_counter():
	var pin_total = 0
	for child in get_children():
		if child.get_child_count() == 1:
			pin_total += 1
		else:
			continue
	
	if pin_total == 0:
		all_clear = true

func add_start_pins():
	all_clear = false
	for child in get_children():
		if child.get_child_count() == 0:
			var new_pin = pin.instantiate()
			new_pin.tree_exiting.connect(func(): ScoreVariables.score += 1)
			child.add_child(new_pin)


func _on_main_ball_gone() -> void:
	await %SetupTimer.timeout
	pin_counter()
	if all_clear == true and ScoreVariables.bowl_count == 1:
		add_start_pins()
		print("Strike!")
		ScoreVariables.bowl_count = 0
		ScoreVariables.score += 10
	elif all_clear == true and ScoreVariables.bowl_count == 2:
		add_start_pins()
		print("Spare")
		ScoreVariables.bowl_count = 0
		ScoreVariables.score += 5
	elif all_clear == false and ScoreVariables.bowl_count == 2:
		add_start_pins()
		ScoreVariables.bowl_count = 0
