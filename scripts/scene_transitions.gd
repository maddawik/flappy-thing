extends AnimationPlayer

func _ready() -> void:
	Events.title_exit.connect(_on_title_exit)
	if !GameManager.skip_intro:
		self.play("title_screen_in")

func _on_title_exit() -> void:
	self.play("title_screen_out")
