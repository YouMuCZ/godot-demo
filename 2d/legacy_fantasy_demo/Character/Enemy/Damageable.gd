extends Node
class_name Damageable

signal on_hit(node : Node, damage_taken : int, direc : Vector2)


@export var hp : float = 20 :
	get:
		return hp
	set(value):
		SignalManager.emit_signal("on_health_changed", get_parent(), value - hp)
		hp = value


func hit(damage : float, direc : Vector2):
	hp -= damage

	emit_signal("on_hit",get_parent(), damage, direc)

	print_debug("Snail took " + str(damage) + " hp")
