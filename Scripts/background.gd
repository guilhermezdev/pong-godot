extends Node

@onready var field = $Field
@onready var divider = $Divider

func _ready():
	var game_settings = ConfigFileHandler.load_game_settings()
	
	field.color = Color(game_settings['field_color'])
	divider.color = Color(game_settings['field_divider_color'])
