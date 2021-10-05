extends "res://entities/AbstractState.gd"


func handle_input(event:InputEvent):
	if event.is_action_pressed("move_left") || event.is_action_pressed("move_right"):
		emit_signal("finished", "walk")
	elif event.is_action_pressed("jump") && parent.is_on_floor():
		emit_signal("finished", "jump")
	elif event.is_action_pressed("dash"):
		emit_signal("finished", "dash")


func update(delta:float):
	parent._handle_cannon_actions()
	parent._handle_deacceleration()
	parent._apply_movement()
