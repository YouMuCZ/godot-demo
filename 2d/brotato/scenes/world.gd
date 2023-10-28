extends Node2D

@onready var tilemap = $TileMap


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	random_tilemap()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func random_tilemap():
	tilemap.clear_layer(1)
	var ground = tilemap.get_used_cells(0)
	for tile in ground:
		if randi_range(0, 100) <= 10:
			tilemap.set_cell(1, tile, 1, Vector2i(18, 1))

