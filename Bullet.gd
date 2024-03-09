extends Area2D

var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Bullet")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x+=delta*speed


func _on_area_entered(area: Area2D) -> void:
	queue_free()
