extends CharacterBody2D

@export var isPlayerControlled := true
@export var isLeft := false

const SPEED = 300.0


func _ready() -> void:
	
	pass

func getInput() -> Vector2:
	var r := Vector2.ZERO
	if isLeft:
		r = Vector2(0 , Input.get_action_strength("sKey") - Input.get_action_strength("wKey"))
	else:
		r = Vector2(0 , Input.get_action_strength("downArrow") - Input.get_action_strength("upArrow"))
	print(r, name)
	return r

func _physics_process(delta: float) -> void:
	velocity = getInput() * SPEED
	move_and_slide()
