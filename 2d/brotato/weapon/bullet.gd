extends CharacterBody2D

var dir = Vector2.ZERO
var speed = 2000
var damage = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = dir * speed
	move_and_slide()


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	# 销毁敌人
	if body.is_in_group("enemy"):
		body.queue_free()

		self.queue_free()

	# 撞墙销毁子弹
	if body is TileMap:
		var coords = body.get_coords_for_body_rid(body_rid)
		var tile_data = body.get_cell_tile_data(2, coords)
		var isWall = tile_data.get_custom_data("isWall")
		if isWall:
			self.queue_free()

