extends CharacterBody2D

var win_size : Vector2
const START_SPEED : int = 500
var acceleration : int
var speed : int
var dir : Vector2

func _ready():
	win_size = get_viewport_rect().size
	var game_settings = ConfigFileHandler.load_game_settings()
	acceleration = game_settings['ball_acceleration']
	
func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	if collision:
		var collider = collision.get_collider()
		if collider == $'../Player' or collider == $'../Player2':
			speed += acceleration
		dir = dir.bounce(collision.get_normal())
	
func start_ball():
	position.x = win_size.x / 2
	position.y = randi_range(50, win_size.y - 50)
	speed = START_SPEED
	dir = random_direction()
	
func random_direction():
	var new_dir = Vector2()
	new_dir.x = [-1, 1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()
