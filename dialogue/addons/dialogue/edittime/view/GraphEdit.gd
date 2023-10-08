@tool
extends GraphEdit


@onready var popup_menu = $PopupMenu


var nodes : Array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	popup_menu.clear()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_popup_request(position):
	pass # Replace with function body.
