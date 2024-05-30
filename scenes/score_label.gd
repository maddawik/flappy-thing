extends Label

func _ready():
	Globals.score_update.connect(update_label)
	
func update_label(value):
	self.text = "%d" % value
