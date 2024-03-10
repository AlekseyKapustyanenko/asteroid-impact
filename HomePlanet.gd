extends StaticBody2D

var health = 1000

signal on_hp_changed(new_hp: int)
signal on_planet_death()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	on_hp_changed.emit(health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func apply_damage(damage:float)->void:
	health-=damage
	on_hp_changed.emit(health)
	if(health<=0):
		death()

func death():
	$HitBox.set_deferred("disabled", true)
	$AnimationPlayer.play("explosion")
	await $AnimationPlayer.animation_finished
	$HomePlanetAnimation.visible=false
	$AnimationPlayer.play("planetDeath")
	await $AnimationPlayer.animation_finished
	on_planet_death.emit()
	
