extends KinematicBody2D

onready var scroll_speed = $"/root/Globals".scroll_speed

func _process(delta):
	if $"/root/Globals".game_state != $"/root/Globals".game_states.dead:
		global_position.x -= scroll_speed * delta
		
		if global_position.x < -450:
			global_position.x += 900
