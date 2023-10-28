extends Node2D


@onready var enemy = preload("res://enemy/enemy.tscn")
var tilemap : TileMap = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tilemap = get_tree().get_first_node_in_group("map")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var num = randi_range(0, len(tilemap.get_used_cells(0)) - 1)
	var position = tilemap.map_to_local(tilemap.get_used_cells(0)[num])
	var temp = enemy.instantiate()
	temp.position = position * Vector2(6, 6)
	self.add_child(temp)
