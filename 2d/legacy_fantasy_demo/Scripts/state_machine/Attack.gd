extends State


@export var return_state : State
@export var attack_1_animation : String = "attack_1"
@export var attacl_2_animation : String = "attack_2"
@onready var timer : Timer = $Timer


func state_input(event : InputEvent):
	if event.is_action_pressed("ui_attack") and not timer.is_stopped():
		playback.travel(attacl_2_animation)


# 计时器,判断是否可以连击
func combo_attack():
	timer.start()


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == attack_1_animation or anim_name == attacl_2_animation:
		next_state = return_state
		playback.travel("move")
