extends Control

@onready var player_1_color_button = $VBoxContainer/Player1Color/Player1ColorButton
@onready var player_2_color_button = $VBoxContainer/Player2Color/Player2ColorButton
@onready var field_color_button = $VBoxContainer/FieldColor/FieldColorButton
@onready var field_divider_color_button = $VBoxContainer/FieldDividerColor/FieldDividerColorButton
@onready var ball_color_button = $VBoxContainer/BallColor/BallColorButton

var player_1_selected_color: Color
var player_2_selected_color: Color
var field_selected_color: Color
var field_divider_selected_color: Color
var ball_selected_color: Color

func _ready():
	var game_settings = ConfigFileHandler.load_game_settings()
	
	player_1_selected_color = Color(game_settings['player_1_color'])
	player_1_color_button.color = player_1_selected_color
	
	player_2_selected_color = Color(game_settings['player_2_color'])
	player_2_color_button.color = player_2_selected_color
	
	field_selected_color = Color(game_settings['field_color'])
	field_color_button.color = field_selected_color
	
	field_divider_selected_color = Color(game_settings['field_divider_color'])
	field_divider_color_button.color = field_divider_selected_color
	
	ball_selected_color = Color(game_settings['ball_color'])
	ball_color_button.color = ball_selected_color

func _on_save_button_pressed():
	ConfigFileHandler.save_game_setting('player_1_color', player_1_selected_color)
	ConfigFileHandler.save_game_setting('player_2_color', player_2_selected_color)
	ConfigFileHandler.save_game_setting('field_color', field_selected_color)
	ConfigFileHandler.save_game_setting('field_divider_color', field_divider_selected_color)
	ConfigFileHandler.save_game_setting('ball_color', ball_selected_color)

func _on_player_1_color_button_color_changed(color):
	player_1_selected_color = color

func _on_player_2_color_button_color_changed(color):
	player_2_selected_color = color

func _on_field_color_button_color_changed(color):
	field_selected_color = color

func _on_field_divider_color_button_color_changed(color):
	field_divider_selected_color = color

func _on_ball_color_button_color_changed(color):
	ball_selected_color = color


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/settings/settings.tscn")
