extends KinematicBody2D

signal game_start
signal game_end
signal reset_game
signal scored

export var gravity = 1500
export var jump_strenght = 500
var move_vector = Vector2.ZERO

onready var initial_position = global_position

func _process(delta):
	if $"/root/Globals".game_state == $"/root/Globals".game_states.playing or $"/root/Globals".game_state == $"/root/Globals".game_states.dead:
		move_vector.y += gravity * delta
		move_and_slide(move_vector)
		rotate_player()
	
	if Input.is_action_just_pressed("jump"):
		if $"/root/Globals".game_state == $"/root/Globals".game_states.playing:
			move_vector.y = -jump_strenght
		elif $"/root/Globals".game_state == $"/root/Globals".game_states.pre_play:
			start()
		elif $"/root/Globals".game_state == $"/root/Globals".game_states.dead:
			emit_signal("reset_game")

func rotate_player():
	if move_vector.y < 300:
		rotation_degrees = -15
	else:
		var clamped_velocity = clamp(move_vector.y, 300, 740) - 300
		rotation_degrees = clamped_velocity / 6

func start():
	$"/root/Globals".game_state = $"/root/Globals".game_states.playing
	$AnimationPlayer.play("flapping")
	emit_signal("game_start")

func die():
	$"/root/Globals".game_state = $"/root/Globals".game_states.dead
	$AnimationPlayer.stop()
	emit_signal("game_end")

func reset():
	position = initial_position
	move_vector = Vector2.ZERO
	rotation_degrees = 0
	$AnimationPlayer.play("bobbing")

func _on_Area2D_body_entered(body):
	die()

func _on_Area2D_area_entered(area):
	$"/root/Globals".score += 1
	emit_signal("scored")
