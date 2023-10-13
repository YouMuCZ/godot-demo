extends Node2D

var weapon_radius = 120


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var weapon_num = self.get_child_count()
	var unit = TAU / weapon_num
	var weapons = self.get_children()

	for i in range(weapon_num):
		var weapon = weapons[i]
		var rad = unit * i
		var end_pos = weapon.position + Vector2(weapon_radius, 0).rotated(rad)
		weapon.position = end_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
