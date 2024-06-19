class_name PlayerTitle

extends State

@export var flap_speed = 0.3
@export var player: CharacterBody2D

@onready var player_sprite: AnimatedSprite2D = %PlayerSprite

func enter():
	player_sprite.speed_scale = flap_speed
	player_sprite.play()

func update(_delta: float):
	if GameManager.skip_intro:
		transitioned.emit(self, "idle")

func physics_update(_delta: float):
	player.velocity.x = player.speed
	if Input.is_action_just_pressed("flap"):
		transitioned.emit(self, "idle")
		Events.title_exit.emit()
