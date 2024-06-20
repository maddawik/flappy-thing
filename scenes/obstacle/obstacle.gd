class_name Obstacle
extends Node2D

@onready var score_zone: Node2D = $ScoreZone

var player: Player

func _physics_process(delta: float) -> void:
	if player and player.global_position.x - global_position.x > 100:
		self.queue_free()

func _on_area_2d_body_entered(body):
	if body is Player:
		player = body
		GameManager.add_point()

func _on_hit_obstacle(body):
	if body is Player and score_zone:
		body.impact_sound.play()
		score_zone.queue_free()
		Events.player_died.emit()
