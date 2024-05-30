extends CharacterBody2D


@export var speed = 200.0
@export var jump_velocity = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("flap"):
		velocity.y = jump_velocity

	velocity.x = speed

	move_and_slide()
