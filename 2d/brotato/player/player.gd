extends CharacterBody2D


var direc = Vector2.ZERO
var speed = 400
var canMove = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var self_pos = position

	direc = (mouse_pos - self_pos).normalized()

	if canMove:
		velocity = direc * speed
		move_and_slide()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		canMove = false

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
		canMove = true



