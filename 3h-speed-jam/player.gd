extends CharacterBody2D

class_name Player

@export var gravity = 300
@export var speed = 200
@export var acceleration = 0.2
@onready var sprite =$Sprite2D 
@export var jump = -200

func _process(delta: float) -> void:
	if !is_on_floor():
		velocity.y = clamp(velocity.y + gravity * delta, -500,500)
	
	var direction = Input.get_axis("move_left",("move_right"))
	if direction != 0 :
		sprite.flip_h = (direction ==-1)
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump
	
	

	
	
	
	
	velocity.x =lerp(velocity.x, direction * speed, acceleration)
	#update_animations(direction)
	move_and_slide()
	
#func update_animations(direction):
	#if is_on_floor():
		#if direction == 0:
			#sprite.play("idle ")
		#else :
			#sprite.play("walk")
	#else :
		#sprite.play("jump")
#
#
func die():
	queue_free()
