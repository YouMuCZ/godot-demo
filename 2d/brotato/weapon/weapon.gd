extends Node2D


@onready var sprite = $Sprite2D
@onready var shoot_pos = $Marker2D
@onready var timer = $Timer
@onready var bullet = preload("res://weapon/bullet.tscn")


var bullet_shoot_time = 0.5
var bullet_speed = 2000
var bullet_damage = 1

var attack_enemy = []


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
		"color", Color(equipment_quality[str(eq)])
		)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if attack_enemy:
		self.look_at(attack_enemy[0].position)
	else:
		rotation_degrees = 0


func _on_timer_timeout() -> void:
	if attack_enemy:
		var temp = bullet.instantiate()
		temp.speed = bullet_speed
		temp.damage = bullet_damage
		temp.position = shoot_pos.global_position
		temp.dir = (attack_enemy[0].global_position - temp.position).normalized()
		get_tree().root.add_child(temp)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy") and !attack_enemy.has(body):
		attack_enemy.append(body)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemy") and attack_enemy.has(body):
		attack_enemy.remove_at(attack_enemy.find(body))
