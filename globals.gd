extends Node

var scroll_speed = 100

var game_states = {
	"pre_play": 0,
	"playing": 1,
	"dead": 2
}

var game_state = game_states.pre_play

var score = 0
