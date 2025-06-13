extends Node2D

@onready var field = $Field
@onready var divider = $Field/Divider

var score := [0, 0]

func _ready():
	var game_settings = ConfigFileHandler.load_game_settings()
	
	field.color = Color(game_settings['field_color'])
	divider.color = Color(game_settings['field_divider_color'])

func _on_goal_left_area_entered(_area):
	print('aaa')
	score[1] += 1
	$Scores/Player2Score.text = str(score[1])
	$GoalSfx.play()
	#$GameTimer.start()

func _on_goal_right_area_entered(_area):
	print('bbb')
	score[0] += 1
	$Scores/PlayerScore.text = str(score[0])
	$GoalSfx.play()
	#$GameTimer.start()
