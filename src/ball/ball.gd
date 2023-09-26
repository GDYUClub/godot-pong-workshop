extends CharacterBody2D

var isStarted := false
var motion := Vector2.ZERO
var bounceCount := 0

func _physics_process(delta: float) -> void:
	var col := move_and_collide(motion)
	
	
# The most basic bounce algo
#	if col:
#		print(col)
#		motion = motion.bounce( col.get_normal() )
	
# Varied bounces 
	if col:
		if col.get_collider().is_in_group("paddle"):
			bounceCount += 10
			var diff :float=  (global_position.y - col.get_collider().global_position.y)/ (360.0 - min(bounceCount, 100))
			var paddleNormal : Vector2 = col.get_normal().rotated( diff )
			motion = motion.bounce( paddleNormal )* 1.2
		else:
			motion = motion.bounce( col.get_normal() ) 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start") and not isStarted:
		isStarted = true
		#randomize starting direction
		if randf() < 0.5:
			motion = Vector2(-10, randf_range(-5,5))
		else:
			motion = Vector2(10, randf_range(-5,5))
			
