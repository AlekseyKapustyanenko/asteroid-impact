extends Node2D

@export var spawnX=0
@export var spanYMin=0
@export var spanYMax=0
@export var minSpeed=30
@export var maxSpeed=50
@export var minSpawnTime =1.0
@export var maxSpawnTime =3.0

@onready var rng = RandomNumberGenerator.new()
var asteroid_preload = preload("res://Asteroid.tscn")

signal asteroid_destroyed_by_bullet(score: int)

func _ready() -> void:
	$Spawner.start()

func _on_spawner_timeout() -> void:
	asteroid_spawn()
	$Spawner.wait_time=rng.randf_range(minSpawnTime,maxSpawnTime)
	$Spawner.start()

func asteroid_spawn() -> void:
	var asteroid = asteroid_preload.instantiate()
	var spawnY = rng.randf_range(spanYMin, spanYMax)
	asteroid.speed=rng.randf_range(minSpeed, maxSpeed)
	asteroid.position = Vector2(spawnX, spawnY)
	asteroid.on_destroyed_by_bullet.connect(on_asteroid_destroyed_by_bullet)
	add_child(asteroid)

func on_asteroid_destroyed_by_bullet(score):
	asteroid_destroyed_by_bullet.emit(score)
