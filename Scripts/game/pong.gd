extends Node2D

@export var game_scale := 1.0
@export var player_1 : PackedScene
@export var player_2: PackedScene

func _ready():
	var p1 = player_1.instantiate()
	var p2 = player_2.instantiate()

	p1.position = Vector2(20, 300)
	p2.position = Vector2(1160, 300)

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
