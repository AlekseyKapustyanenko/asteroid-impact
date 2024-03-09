extends Node2D

var shipHp:int
var planetHp:int
var scores=0;

signal scores_changed(scores:int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_home_planet_on_hp_changed(new_hp: int) -> void:
	planetHp = new_hp

func _on_ship_on_hp_changed(new_hp: int) -> void:
	shipHp = new_hp


func _on_asteroids_asteroid_destroyed_by_bullet(score: int) -> void:
	scores+=score
	scores_changed.emit(scores)
