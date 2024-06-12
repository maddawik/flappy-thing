extends CanvasLayer

@onready var score: Label = $Score
@onready var score_value_label: Label = %ScoreValueLabel
@onready var high_score_value_label: RichTextLabel = %HighScoreValueLabel
@onready var hint: Control = $Hint

@onready var game_over_screen: Control = $GameOver

@onready var play_button: Button = %PlayButton


func _ready():
	Events.score_update.connect(_update_score)
	Events.show_hint.connect(_show_hint)
	Events.hide_hint.connect(_hide_hint)
	Events.player_died.connect(_show_game_over_menu)
	play_button.pressed.connect(GameManager.reset_game)

func _show_game_over_menu() -> void:
	score.visible = false
	score_value_label.text = "%d" % GameManager.player_score
	if GameManager.player_score > GameManager.high_score:
		high_score_value_label.text = "[center][wave]%d[/wave][/center]" % GameManager.player_score
	else:
		high_score_value_label.text = "[center]%d[/center]" % GameManager.high_score
	game_over_screen.visible = true


func _update_score(value):
	score.text = "%d" % value


func _show_hint() -> void:
	hint.visible = true


func _hide_hint() -> void:
	hint.visible = false
