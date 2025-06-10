extends Control

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")

func _on_game_settings_button_pressed():
	get_tree().change_scene_to_file("res://scenes/settings/game_settings.tscn")

func _on_color_settings_button_pressed():
	get_tree().change_scene_to_file("res://scenes/settings/color_settings.tscn")
