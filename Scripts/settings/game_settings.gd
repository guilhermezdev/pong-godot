extends Control

@onready var accel_label = $VBoxContainer/AccelerationLabel
@onready var accel_slider = $VBoxContainer/AccelerationSlider

var accel_value: float

func _ready():
	var game_settings = ConfigFileHandler.load_game_settings()
	accel_value = game_settings['ball_acceleration']
	accel_slider.value = accel_value
	update_accel_label()
	
func update_accel_label():
	accel_label.text = 'ACCELERATION: ' + str(accel_value)
	
func _on_acceleration_slider_value_changed(value):
	accel_value = value
	update_accel_label()

func _on_save_button_pressed():
	ConfigFileHandler.save_game_setting('ball_acceleration', accel_value)

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/settings/settings.tscn")
