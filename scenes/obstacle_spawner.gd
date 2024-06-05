extends Node2D

@onready var obstacles = %Obstacles
@onready var timer = $Timer

@export var offset: int = 20
var obstacle_scene = preload("res://scenes/obstacle/obstacle.tscn")

func _on_timer_timeout() -> void:
	spawn_obstacle()

func _process(delta):
	self.global_position.y = 90

func spawn_obstacle():
	var offset = (randi() % offset) - (offset/2)
	var obstacle = obstacle_scene.instantiate() as Node2D
	obstacle.global_position = Vector2(self.global_position.x, self.global_position.y + offset)
	obstacles.add_child(obstacle)
