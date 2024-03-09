extends Node2D

@export var spawnX=0
@export var spanYMin=0
@export var spanYMax=0

@onready var rng = RandomNumberGenerator.new()
var asteroid_preload = preload("res://Asteroid.tscn")

signal asteroid_destroyed_by_bullet(score: int)

func _ready() -> void:
	$Spawner.start()

func _on_spawner_timeout() -> void:
	asteroid_spawn()
	$Spawner.wait_time=rng.randf_range(1,3)
	$Spawner.start()

func asteroid_spawn() -> void:
	var asteroid = asteroid_preload.instantiate()
	var spawnY = rng.randf_range(spanYMin, spanYMax)
	asteroid.position = Vector2(spawnX, spawnY)
	asteroid.on_destroyed_by_bullet.connect(on_asteroid_destroyed_by_bullet)
	add_child(asteroid)

func on_asteroid_destroyed_by_bullet(score):
	asteroid_destroyed_by_bullet.emit(score)
