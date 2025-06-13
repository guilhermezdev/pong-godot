extends StaticBody2D

var win_height : int
var p_height : int
var ball_pos : Vector2
var dist_to_ball_on_y : int
var move_by: int

@export var speed := 500

func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
		
	var game_settings = ConfigFileHandler.load_game_settings()
	var color = game_settings[ 'player_2_color' ]
	$ColorRect.color = color

func _process(delta):
	var balls = get_tree().get_nodes_in_group("ball")
	if balls.is_empty():
		return
	
	ball_pos = balls[0].position
	dist_to_ball_on_y = position.y - ball_pos.y
	
	move_by = speed * delta
	
	if abs(dist_to_ball_on_y) > move_by:
		move_by = move_by * (dist_to_ball_on_y / abs(dist_to_ball_on_y))
	else:
		move_by = dist_to_ball_on_y
	
	position.y -= move_by
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
