extends RigidBody2D

@onready var curve_force = Vector2(500, 0)
@onready var throw_speed: float = 1.0
@onready var throw_velocity = Vector2(0,-500)
@onready var curve = Vector2(randf_range(-1, 1), 0) * curve_force
var decay_rate = 0.9

# This should be called whenever the user presses the bowl button and the ball enters the scene
func _ready() -> void:
	var throw = throw_velocity * throw_speed
	apply_central_impulse(throw)

# This applies the curve during play and the speed boost in the gutter
func _physics_process(delta: float) -> void:
	if curve_force.length() > 1:
		apply_force(curve)
		
		curve_force *= pow(decay_rate, delta)
	else:
		curve_force = Vector2.ZERO
	
	if ScoreVariables.zooming == true:
		var zoom = throw_velocity * 3
		apply_central_force(zoom)
