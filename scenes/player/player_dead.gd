class_name PlayerDead

extends State

@export var flap_speed = 0
@export var player: CharacterBody2D

@onready var player_sprite: AnimatedSprite2D = %PlayerSprite
@onready var player_collision: CollisionShape2D = %CollisionShape2D

func physics_update(delta: float):
	player.velocity.x *= 0.96
	player.velocity.y = clamp((player.velocity.y + player.gravity * delta), -400, 250)
	if player.velocity.y <= -100:
		player_sprite.frame = 2
	elif -100 < player.velocity.y and player.velocity.y < 100:
		player_sprite.frame = 1
	else:
		player_sprite.frame = 0
