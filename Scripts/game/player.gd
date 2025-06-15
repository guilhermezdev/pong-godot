extends StaticBody2D

var win_height := 600
var p_height : int

@export var player_type = 1
@export var up_keys = ['move_up', 'move_up_2']
@export var down_keys = ['move_down', 'move_down_2']
@export var speed := 500

func _ready():
	p_height = $ColorRect.get_size().y
	
	var game_settings = ConfigFileHandler.load_game_settings()
	var color = game_settings[ 'player_1_color' if player_type == 1 else 'player_2_color' ]
	$ColorRect.color = color

func _process(delta):
	var move := 0
	for key in up_keys:
		if Input.is_action_pressed(key):
			move -= 1
			break
	for key in down_keys:
		if Input.is_action_pressed(key):
			move += 1
			break
	position.y += move * speed * delta
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
