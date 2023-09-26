extends CharacterBody2D

var motion := Vector2(-10,3)

func _physics_process(delta: float) -> void:
	var col := move_and_collide(motion)
	
	
# The most basic bounce algo
#	if col:
#		print(col)
#		motion = motion.bounce( col.get_normal() )
	
# Varied bounces 
	if col:
		if col.get_collider().is_in_group("paddle"):
			var diff :float=  (global_position.y - col.get_collider().global_position.y)/360.0
			var paddleNormal : Vector2 = col.get_normal().rotated( diff )
			motion = motion.bounce( paddleNormal )
		else:
			motion = motion.bounce( col.get_normal() )
		
