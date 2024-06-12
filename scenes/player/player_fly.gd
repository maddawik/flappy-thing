class_name PlayerFly

extends State

@export var flap_speed = 2.2
@export var fall_speed = 0.6
@export var player: CharacterBody2D

@onready var player_sprite: AnimatedSprite2D = %PlayerSprite

func _ready() -> void:
	Events.player_died.connect(_on_player_died)

func enter():
	player_sprite.speed_scale = flap_speed
	player.velocity.y = player.jump_velocity


func physics_update(delta: float):
	player.velocity.x = player.speed
	
	if player.velocity.y > 0:
		player_sprite.speed_scale = fall_speed
	else:
		player_sprite.speed_scale = flap_speed

	player.velocity.y = clamp((player.velocity.y + player.gravity * delta), -400, 250)

	# Handle jump.
	if Input.is_action_just_pressed("flap"):
		player.velocity.y = player.jump_velocity

func _on_player_died() -> void:
	transitioned.emit(self, "dead")
