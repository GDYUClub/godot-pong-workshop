extends CharacterBody2D

@export var isPlayerControlled := true
@export var isLeft := false

const SPEED = 300.0


func _ready() -> void:
	
	pass

func getYInput() -> float:
	var r := 0.0
	if isPlayerControlled:
		if isLeft:
			r = Input.get_action_strength("sKey") - Input.get_action_strength("wKey")
		else:
			r =  Input.get_action_strength("downArrow") - Input.get_action_strength("upArrow")
	else:
		var ball : CharacterBody2D = get_tree().get_first_node_in_group("ball")
		r = (ball.global_position.y - global_position.y) / 30.0
	return r

func _physics_process(delta: float) -> void:
	velocity = Vector2(0,getYInput() )* SPEED
	move_and_slide()
