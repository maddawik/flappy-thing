extends CanvasLayer

@onready var score: Label = $Score
@onready var high_score: Label = $HighScore

func _ready():
	GameManager.score_update.connect(update_score)
	if GameManager.high_score > 0:
		high_score.text = str(GameManager.high_score)
	
func update_score(value):
	score.text = "%d" % value
