extends Area2D

@export var isLeft := false

func _ready() -> void:
	self.body_entered.connect(smthEntered)


func smthEntered( body:Node2D ) -> void:
	if body.is_in_group("ball"):
		if isLeft:
			GlobalScores.rightScore += 1
		else:
			GlobalScores.leftScore += 1
		get_tree().reload_current_scene()
