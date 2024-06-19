class_name PlayerIdle

extends State

@export var flap_speed = 0.5
@export var player: CharacterBody2D

var hint_timer: Timer

@onready var player_sprite: AnimatedSprite2D = %PlayerSprite


func enter():
	player_sprite.speed_scale = flap_speed
	player_sprite.play()
	hint_timer = Timer.new()
	add_child(hint_timer)
	hint_timer.one_shot = true
	hint_timer.timeout.connect(_on_hint_timer_timeout)
	hint_timer.start(5)


func _on_hint_timer_timeout() -> void:
	Events.show_hint.emit()


func exit():
	hint_timer.queue_free()
	Events.hide_hint.emit()
	Events.game_started.emit()


func physics_update(_delta: float):
	player.velocity.x = player.speed
	if Input.is_action_just_pressed("flap"):
		transitioned.emit(self, "fly")
