extends Area2D

@export var speed = 2
@onready var Left_limit=$"../LeftLimit"
@onready var Right_limit=$"../RightLimit"
@onready var sprite =$Sprite2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player : 
		body.die()
		get_tree().reload_current_scene()



func _physics_process(delta: float) -> void:
	global_position.x += speed
	
	if global_position.x  >= Right_limit.global_position.x :
		speed = -speed
		sprite.flip_h= false
	elif  global_position.x  <= Left_limit.global_position.x :
		speed = -speed
		sprite.flip_h= true
		
