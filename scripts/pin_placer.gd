extends Node

var all_clear = false

@onready var pin = preload("res://scenes/bowling_pin.tscn")

func _ready() -> void:
	add_start_pins()
	
# A simple function to check if any pins are standing and show all_clear if they're not
# Basically the same as add_start_pins() below without adding the pins. Probably so similar I don't need it. Maybe.
func pin_counter():
	var pin_total = 0
	for child in get_children():
		if child.get_child_count() == 1:
			pin_total += 1
		else:
			continue
	
	if pin_total == 0:
		all_clear = true

# Checks each marker2d in the PinPositions node. If there isn't a pin already, it places one there.
func add_start_pins():
	all_clear = false
	for child in get_children():
		if child.get_child_count() == 0:
			var new_pin = pin.instantiate()
			new_pin.tree_exiting.connect(func(): ScoreVariables.score += (ScoreVariables.pin_point * ScoreVariables.pin_multi))
			child.add_child(new_pin)

# When the ball exits the scene, after the SetupTimer is finished it counts the pins
# If it's the first thrown ball and all the pins are knocked down, you get a strike and start a new "frame"
# If it's the second and all pins are knocked down, you get a spare and start a new "frame"
# If it's the second and there are still pins up, it just starts a new "frame"
func _on_main_ball_gone() -> void:
	await %SetupTimer.timeout
	pin_counter()
	if all_clear == true and ScoreVariables.bowl_count == 1:
		add_start_pins()
		%StrikeLabel.visible = true
		ScoreVariables.bowl_count = 0
		ScoreVariables.score += 10
	elif all_clear == true and ScoreVariables.bowl_count == 2:
		add_start_pins()
		%SpareLabel.visible = true
		ScoreVariables.bowl_count = 0
		ScoreVariables.score += 5
	elif all_clear == false and ScoreVariables.bowl_count == 2:
		add_start_pins()
		ScoreVariables.bowl_count = 0
