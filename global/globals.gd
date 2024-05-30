extends Node

signal score_update(value)

var player_score : int:
	set(value):
		player_score = value
		score_update.emit(player_score)
