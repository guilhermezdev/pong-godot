extends StaticBody2D

var win_height : int
var p_height : int

@export var up_keys = ['ui_up', 'ui_up_2']
@export var down_keys = ['ui_down', 'ui_down_2']

func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y

func _process(delta):
	for key in up_keys:	
		if Input.is_action_pressed(key):
			position.y -= get_parent().PADDLE_SPEED * delta
	for key in down_keys:	
		if Input.is_action_pressed(key):
			position.y += get_parent().PADDLE_SPEED * delta
			
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
