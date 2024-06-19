extends Node

var player_score := 0
var high_score := 0
var skip_intro := false

@onready var death_timer: Timer = $DeathTimer


func _ready() -> void:
	Events.player_died.connect(_on_player_died)


func add_point() -> void:
	player_score += 1
	AudioManager.point_sound.play()
	Events.score_update.emit(player_score)


func _on_player_died() -> void:
	Engine.time_scale = 0.8
	death_timer.start()


func reset_game() -> void:
	if player_score > high_score:
		high_score = player_score
	player_score = 0
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
