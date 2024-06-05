extends Node

signal score_update(value)
signal high_score_update(value)
signal player_died()

var player_score : int = 0
var high_score : int = 0

@onready var death_timer: Timer = $DeathTimer
	
func add_point() -> void:
	player_score += 1
	score_update.emit(player_score)

func _on_player_died() -> void:
	Engine.time_scale = 0.1
	death_timer.start()
	
func reset_game() -> void:
	if player_score > high_score:
		high_score = player_score
	player_score = 0
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
