extends Node

# ...this can't be how singletons work, right?
@onready var pin_point: int = 1

@onready var pin_multi: int = 1

@onready var curve_x: int = 0

@onready var start_x: int = 0

@onready var score: int = 0

@onready var bowl_count: int = 0

@onready var gutterballs: int = 0

@onready var start_pos_bought: bool = false

@onready var pin_struck: bool = false

@onready var zooming: bool = false

@onready var curve_button_pressed: bool = false
