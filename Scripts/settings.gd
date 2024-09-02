extends Control

@onready var speed_value_label =  $VBoxContainer/SpeedValue
@onready var speed_value_slider = $VBoxContainer/SpeedSlider
# Called when the node enters the scene tree for the first time.
func _ready():
	var game_settings = ConfigFileHandler.load_game_settings()
	var ball_acceleration = game_settings['ball_acceleration']
	speed_value_label.text = str(ball_acceleration)
	speed_value_slider.value = ball_acceleration
	
func _on_speed_slider_value_changed(value):
	speed_value_label.text = str(value)

func _on_save_button_pressed():
	ConfigFileHandler.save_game_setting('ball_acceleration', speed_value_slider.value)
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
