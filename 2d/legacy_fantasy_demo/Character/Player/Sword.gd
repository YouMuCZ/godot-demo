extends Area2D

@export var damage : float = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		if child is Damageable:
			var direc = body.global_position - get_parent().global_position
			var direc_sign = sign(direc.x)

			if direc_sign > 0:
				child.hit(damage, Vector2.RIGHT)
			else:
				child.hit(damage, Vector2.LEFT)
