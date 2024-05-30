extends Node2D

@onready var timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if self.global_position.x < -100:
		self.queue_free()


func _on_area_2d_body_entered(body):
	Globals.player_score += 1


func _on_hit_obstacle(body):
	print("you ded")
	Engine.time_scale = 0.1
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
