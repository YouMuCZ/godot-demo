extends Node
class_name CharacterStateMachine

@export var animation_tree : AnimationTree
@export var character : CharacterBody2D
@export var curr_state : State

var states : Array[State]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is State:
			states.append(child)
			child.character = character
			child.playback = animation_tree["parameters/playback"]


func _physics_process(delta: float) -> void:
	if curr_state.next_state:
		switch_states(curr_state.next_state)

	curr_state.state_process(delta)


func check_can_move():
	return curr_state.can_move


func switch_states(new_state : State):
	if curr_state:
		curr_state.on_exit()
		curr_state.next_state = null

	curr_state = new_state
	curr_state.on_enter()


func  _input(event: InputEvent) -> void:
	curr_state.state_input(event)
