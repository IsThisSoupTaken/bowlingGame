extends RigidBody2D
class_name BowlingBall

@export var throw_speed: float = .90
@onready var curve_force = Vector2(750, 0)
@onready var throw_velocity = Vector2(0,-500)
@onready var curve_rand = Vector2(randf_range(-1, 1), 0) * curve_force
var decay_rate = 0.9

# This is called whenever the user presses the bowl button and the ball enters the scene
func _ready() -> void:
	var throw = throw_velocity * throw_speed
	apply_central_impulse(throw)
	
# This applies the user's chosen curve
func _process(_delta: float) -> void:
	if ScoreVariables.curve_button_pressed == true:
		curve_force = Vector2(ScoreVariables.curve_x, 0)
		curve_rand = curve_force
		
# This applies the curve during play and the speed boost in the gutter
func _physics_process(delta: float) -> void:
	if curve_force.length() > 1:
		apply_force(curve_rand)
		
		curve_force *= pow(decay_rate, delta)
	else:
		curve_force = Vector2.ZERO
	
	if ScoreVariables.zooming == true:
		var zoom = throw_velocity * 3
		apply_central_force(zoom)
