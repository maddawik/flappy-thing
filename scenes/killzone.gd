extends Area2D


func _on_body_entered(_body):
	Events.player_died.emit()
