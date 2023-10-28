extends Node2D


@onready var sprite = $Sprite2D


const equipment_quality = {
	"1" = "#b0c3d9",
	"2" = "#4b69ff",
	"3" = "#d32ce6",
	"4" = "#8847ff",
	"5" = "#eb4b4b",
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var eq = randi_range(1, 5)
	sprite.material.set_shader_parameter(
		"line_color", Color(equipment_quality[str(eq)])
		)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
