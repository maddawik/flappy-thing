extends Area2D


func _on_body_entered(body: Player):
	body.fall_sound.play()
	Events.player_died.emit()
