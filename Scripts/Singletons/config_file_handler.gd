extends Node

const SETTINGS_FILE_PATH = 'user://settings.cfg'

var config = ConfigFile.new()

func _ready():
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		_write_default_values()
	else:
		config.load(SETTINGS_FILE_PATH)

func _write_default_values():
	config.set_value('game', 'ball_acceleration', 50)
	config.save(SETTINGS_FILE_PATH)
	
func load_game_settings():
	var settings = {}
	for key in config.get_section_keys('game'):
		settings[key] = config.get_value('game', key)
	return settings
	
func save_game_setting(key: String, value):
	config.set_value('game', key, value)
	config.save(SETTINGS_FILE_PATH)
	
