extends CharacterBody2D

@export var speed = 150.0
@export var flap_speed = 2.2
@export var jump_velocity = -280.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float):
	velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("flap"):
		velocity.y = jump_velocity

	velocity.x = speed

	move_and_slide()

	if velocity.y < 0:
		animated_sprite_2d.speed_scale = flap_speed
	else:
		animated_sprite_2d.speed_scale = 1

	self.global_position.y = clamp(self.global_position.y, 10, 300)
