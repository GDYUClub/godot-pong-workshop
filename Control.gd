extends Control

@export var isLeftLabel := false

func _ready() -> void:
	if isLeftLabel:
		$Label.text = str(GlobalScores.leftScore)
	else:
		$Label.text = str(GlobalScores.rightScore)
