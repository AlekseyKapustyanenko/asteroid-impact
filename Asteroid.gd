extends CharacterBody2D


var rotationSpeed:float
var speed:float
@onready var anim = $AnimatedSprite2D

func _ready() -> void:
	print("Asteroid ready " + name)
	var rng = RandomNumberGenerator.new()
	rotationSpeed=rng.randf_range(-360.0, 360.0)
	speed=rng.randf_range(30.0, 50.0)
	velocity.x=-speed;

func _physics_process(delta: float) -> void:
	rotation_degrees=rotation_degrees+delta*rotationSpeed

	move_and_slide()



func _on_asteroid_surface_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print(body.name)	
	anim.play("Explode")
	await anim.animation_finished
	queue_free()
