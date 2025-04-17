extends CharacterBody2D

var movement_speed = 125
var character_direction : Vector2
var isAttacking = false;

#basic movements with normalized
func _physics_process(delta):
	character_direction.x = Input.get_axis("move-left","move-right")
	character_direction.y = Input.get_axis("move-up","move-down")
	character_direction = character_direction.normalized()


#idle or walk animation
	if character_direction:
		velocity = character_direction * movement_speed
		if %sprite.animation != "walk": %sprite.animation = "walk"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		if %sprite.animation != "idle": %sprite.animation = "idle"
		
	move_and_slide()
