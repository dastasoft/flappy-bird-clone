extends Node

func _on_Player_reset_game():
	$Pipes/Pipe.reset()
	$Pipes/Pipe2.reset()
	$Player.reset()
	$"/root/Globals".game_state = $"/root/Globals".game_states.pre_play
	$"/root/Globals".score = 0
	$UI/Label.text = "0"
	$UI/Label.visible = true
	$UI/Scoreboard.visible = false


func _on_Player_scored():
	$UI/Label.text = str($"/root/Globals".score)


func _on_Player_game_start():
	$UI/Label.visible = true
	
	$UI/Scoreboard.visible = false


func _on_Player_game_end():
	$UI/Label.visible = false
	
	$UI/Scoreboard/ScoreLabel.text = str($"/root/Globals".score)
	if $"/root/Globals".score > int($UI/Scoreboard/BestLabel.text):
		$UI/Scoreboard/BestLabel.text = str($"/root/Globals".score)
	$UI/Scoreboard.visible = true
