extends Node2D

@onready var score_zone: Node2D = $ScoreZone

func _physics_process(_delta):
	if self.global_position.x < -100:
		self.queue_free()

func _on_area_2d_body_entered(body):
	if body is Player:
		GameManager.add_point()

func _on_hit_obstacle(body):
	if body is Player and score_zone:
		body.impact_sound.play()
		score_zone.queue_free()
		Events.player_died.emit()
