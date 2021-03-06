extends "res://entities/AbstractStateMachine.gd"


func _ready():
	states_map = {
		"idle": $Idle,
		"walk": $Walk,
		"jump": $Jump,
		"dead": $Dead,
		"dash": $Dash
	}


func notify_hit(amount):
	PlayerData.current_health += min(amount, PlayerData.max_health)
	current_state.notify_hit(PlayerData.current_health)
