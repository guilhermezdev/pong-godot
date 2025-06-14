extends Node2D

signal goal_scored

@onready var field = $Field
@onready var divider = $Field/Divider

var score := [0, 0]

func _ready():
	var game_settings = ConfigFileHandler.load_game_settings()
	
	field.color = Color(game_settings['field_color'])
	divider.color = Color(game_settings['field_divider_color'])

func _on_goal_left_body_entered(body):
	print(body)
	score[1] += 1
	$Scores/Player2Score.text = str(score[1])
	$GoalSfx.play()
	goal_scored.emit()

func _on_goal_right_body_entered(body):
	print(body)
	score[0] += 1
	$Scores/PlayerScore.text = str(score[0])
	$GoalSfx.play()
	goal_scored.emit()
