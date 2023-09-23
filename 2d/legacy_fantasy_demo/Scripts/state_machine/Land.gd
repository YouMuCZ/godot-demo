extends State
class_name LandState

@export var ground_state : State
@export var jump_end_animation : String = "move"


func on_enter():
	playback.travel(jump_end_animation)
	next_state = ground_state
