class_name Player
extends CharacterBody2D

@export var speed = 120.0

@export var jump_velocity = -230.0

#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 600


func _physics_process(_delta: float):
	# Invisible ceiling
	self.global_position.y = clamp(self.global_position.y, 10, 300)
	move_and_slide()
