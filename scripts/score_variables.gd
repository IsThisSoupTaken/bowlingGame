extends Node

# ...this can't be how singletons work, right?

@onready var curve_x: int = 0

@onready var score: int = 0

@onready var bowl_count: int = 0

@onready var gutterballs: int = 8

@onready var pin_struck: bool = false

@onready var zooming: bool = false

@onready var curve_button_pressed: bool = false
