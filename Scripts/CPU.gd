extends StaticBody2D

var win_height : int
var p_height : int
var ball_pos : Vector2
var dist_to_ball_on_y : int
var move_by: int
# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ball_pos = $"../Ball".position
	dist_to_ball_on_y = position.y - ball_pos.y
	
	move_by = get_parent().PADDLE_SPEED * delta
	
	if abs(dist_to_ball_on_y) > move_by:
		move_by = move_by * (dist_to_ball_on_y / abs(dist_to_ball_on_y))
	else:
		move_by = dist_to_ball_on_y
	
	position.y -= move_by
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
