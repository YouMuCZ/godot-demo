@tool
extends EditorPlugin


var main_window


func _enter_tree():
	# Initialization of the plugin goes here.
	main_window = preload("res://addons/dialogue/edittime/view/main_window.tscn").instantiate()
	get_editor_interface().get_editor_main_screen().add_child(main_window)


func _exit_tree():
	# Clean-up of the plugin goes here.
	if main_window:
		main_window.queue_free()
	

func _has_main_screen():
	return true


func _make_visible(visible):
	if main_window:
		main_window.visible = visible


func _get_plugin_name():
	return "Dialogue"


func _get_plugin_icon():
#	return preload("res://addons/dialogue/edittime/resources/icons/Dialogue.svg")
	return get_editor_interface().get_base_control().get_theme_icon("Node", "EditorIcons")

