extends StaticBody2D

var health = 1000

signal on_hp_changed(new_hp: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	on_hp_changed.emit(health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func apply_damage(damage:float)->void:
	health-=damage
	on_hp_changed.emit(health)
