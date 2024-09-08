extends Node

var score := [0, 0]
const PADDLE_SPEED : int = 500

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_game_timer_timeout():
	$Ball.start_ball()

func _on_goal_left_body_entered(body):
	score[1] += 1
	$Background/Scores/Player2Score.text = str(score[1])
	$GameTimer.start()

func _on_goal_right_body_entered(body):
	score[0] += 1
	$Background/Scores/PlayerScore.text = str(score[0])
	$GameTimer.start()
