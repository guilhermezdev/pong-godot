extends Node2D

@export var game_scale := 1.0
@export var player_1 : PackedScene
@export var player_2: PackedScene

@onready var first_position = $FirstPosition
@onready var second_position = $SecondPosition

func _ready():
	var p1 = player_1.instantiate()
	var p2 = player_2.instantiate()

	p1.position = first_position.position
	p2.position = second_position.position

	add_child(p1)
	add_child(p2)
	
	scale = Vector2.ONE * game_scale
	
func _process(_delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")

func _on_game_timer_timeout():
	$Ball.start_ball()

func _on_board_goal_scored():
	$GameTimer.start()
