extends State
class_name HitState

@export var dead_state : State
@export var damageable : Damageable
@export var return_state : State

@onready var timter : Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	damageable.connect("on_hit", on_damageable_hit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_enter():
	timter.start()


func on_exit():
	character.velocity = Vector2.ZERO


func on_damageable_hit(node : Node, damage_count : int, direc : Vector2):
	if damageable.hp > 0:
		character.velocity = direc * 30
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel("dead")


func _on_timer_timeout() -> void:
	next_state = return_state
