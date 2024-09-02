extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer/VS CPU".grab_focus()

func _on_vs_cpu_pressed():
	get_tree().change_scene_to_file("res://Scenes/pong.tscn")

func _on_vs_player_pressed():
	pass # Replace with function body.

func _on_options_pressed():
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()
