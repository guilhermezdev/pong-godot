extends CharacterBody2D

@export var start_speed := 500
@export var rotation_speed := 10
@onready var sfx = $BouncePaddleSfx
@onready var sprite = $Sprite
@onready var collision_shape_2d = $CollisionShape2D

var acceleration : int
var speed : int
var dir : Vector2

@export_range(0, 6, 1) var ball_type: int = 0
var ball_textures = [
	preload("res://images/baseball.png"),
	preload("res://images/basketball.png"),
	preload("res://images/bowling.png"),
	preload("res://images/football.png"),
	preload("res://images/golf.png"),
	preload("res://images/tennis.png"),
	preload("res://images/volleyball.png")
]

func _ready():
	collision_shape_2d.disabled = true
	visible = false
	var game_settings = ConfigFileHandler.load_game_settings()
	acceleration = game_settings['ball_acceleration']
	set_ball_texture(ball_type)
	
func _physics_process(delta):
	rotation += rotation_speed * delta
	var collision = move_and_collide(dir * speed * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group('player'):
			speed += acceleration
		if collider.is_in_group('paddle'):
			sfx.play()
		dir = dir.bounce(collision.get_normal())
		
func set_ball_texture(index: int):
	if index >= 0 and index < ball_textures.size():
		sprite.texture = ball_textures[index]

func start_ball():
	collision_shape_2d.disabled = false
	visible = false
	position.x = 1200 / 2
	position.y = randi_range(50, 600 - 50)
	visible = true
	speed = start_speed
	dir = random_direction()
	
func random_direction():
	var new_dir = Vector2()
	new_dir.x = [-1, 1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()
