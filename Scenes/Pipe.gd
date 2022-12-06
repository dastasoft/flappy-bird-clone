extends KinematicBody2D

onready var scroll_speed = $"/root/Globals".scroll_speed
onready var move_vector = Vector2(-scroll_speed, 0)
onready var initial_position = global_position

export var minimum_pipe_height = -120
export var maximum_pipe_height = 50

var screen_width = 450
var pipe_width = 96
var rnd = RandomNumberGenerator.new()


func _ready():
	rnd.randomize()
	set_pipe_height()


func _process(delta):
	if $"/root/Globals".game_state == $"/root/Globals".game_states.playing:
		move_and_slide(move_vector)
		
		if global_position.x < -((screen_width + pipe_width) / 2):
			global_position.x += screen_width + pipe_width

func set_pipe_height():
	global_position.y = rnd.randi_range(minimum_pipe_height, maximum_pipe_height)

func reset():
	position = initial_position

