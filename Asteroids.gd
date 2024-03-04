extends Node2D

@export var spawnX=0
@export var spanYMin=0
@export var spanYMax=0

@onready var rng = RandomNumberGenerator.new()
var asteroid_preload = preload("res://Asteroid.tscn")

func _ready() -> void:
	$Spawner.start()

func _on_spawner_timeout() -> void:
	print(str($Spawner.wait_time))
	asteroid_spawn()
	$Spawner.wait_time=rng.randf_range(1,3)
	$Spawner.start()

func asteroid_spawn() -> void:
	var asteroid = asteroid_preload.instantiate()
	var spawnY = rng.randf_range(spanYMin, spanYMax)
	asteroid.position = Vector2(spawnX, spawnY)
	add_child(asteroid)
