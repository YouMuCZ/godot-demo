extends CharacterBody2D

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var character_state_machine : CharacterStateMachine = $CharacterStateMachine

@export var hit_state : State
var move_speed = 30


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	animation_tree.active = true
	$CollisionShape2D.disabled = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if character_state_machine.check_can_move():
		velocity.x = Vector2.LEFT.x * move_speed
#	else:
#		velocity.x = move_toward(velocity.x, 0, move_speed)

	move_and_slide()
