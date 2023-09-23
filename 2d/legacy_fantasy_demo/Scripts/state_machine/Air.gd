extends State
class_name AirState

@export var land_state : State
@export var jump_fall_animation : String = "jump_fall"
@export var double_jump_animtion : String = "jump_start"
@export var double_jump_velocity : float = -300.0


var has_double_jumped = false


func state_process(delta):
	if character.is_on_floor():
		next_state = land_state
	else:
		if character.velocity.y > 0:
			playback.travel(jump_fall_animation)


func state_input(event : InputEvent):
	if event.is_action_pressed("ui_jump") and not has_double_jumped:
		double_jump()


func on_exit():
	if next_state == land_state:
		has_double_jumped = false


func double_jump():
	playback.travel(double_jump_animtion)
	character.velocity.y = double_jump_velocity
