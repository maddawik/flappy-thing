extends Node2D


func _physics_process(delta):
	if self.global_position.x < -100:
		self.queue_free()

func _on_area_2d_body_entered(body):
	GameManager.add_point()

func _on_hit_obstacle(body):
	GameManager.player_died.emit()
