extends Node
class_name State

@export var can_move : bool = true

var next_state : State
var character : CharacterBody2D
var playback : AnimationNodeStateMachinePlayback


signal interrupt_state(new_state : State)


# 物理tick
func state_process(delta):
	pass


func state_input(event : InputEvent):
	pass


func on_enter():
	pass


func on_exit():
	pass
