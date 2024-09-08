extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer/VS CPU".grab_focus()

func _on_vs_cpu_pressed():
	get_tree().change_scene_to_file("res://Scenes/game/pong_vs_cpu.tscn")

func _on_vs_player_pressed():
	get_tree().change_scene_to_file("res://Scenes/game/pong_vs_player.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")

func _on_exit_pressed():
	get_tree().quit()
