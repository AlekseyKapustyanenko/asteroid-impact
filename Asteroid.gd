class_name Asteroid
extends Area2D

signal on_destroyed_by_bullet(score)

var rotationSpeed:float
@export var speed:float
@onready var anim = $AteroidAnimation
var damage:int


func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	rotationSpeed=rng.randf_range(-360.0, 360.0)
	damage=rng.randi_range(10,20)

func _process(delta: float) -> void:
	rotation_degrees=rotation_degrees+delta*rotationSpeed
	position.x=position.x-speed*delta;

func _on_body_entered(body: Node2D) -> void:
	if(body.has_method("apply_damage")):
		body.apply_damage(damage);
	anim.play("Explode")
	await anim.animation_finished
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Bullet")):
		$AsteroidCollision.set_deferred("disabled", true)
		on_destroyed_by_bullet.emit(damage)		
	anim.play("Explode")
	await anim.animation_finished
	queue_free()
