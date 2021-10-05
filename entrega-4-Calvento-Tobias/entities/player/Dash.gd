extends "res://entities/AbstractState.gd"

var original_velocity:float
var original_acceleration:float

func enter():
	original_velocity = parent.velocity.x
	original_acceleration = parent.ACCELERATION
	parent.ACCELERATION = parent.ACCELERATION * 500
	parent.velocity.x = parent.velocity.x * 20
	parent._apply_movement()

func exit():
	parent.ACCELERATION = original_acceleration
	parent.velocity.x = original_velocity

func update(delta):
	parent._handle_cannon_actions()
	parent._handle_move_input()
	parent._apply_movement()
	if parent.move_direction == 0 :
		parent._handle_deacceleration()
	if parent.is_on_floor():
		if parent.move_direction != 0:
			emit_signal("finished", "walk")
		else:
			emit_signal("finished", "idle")
