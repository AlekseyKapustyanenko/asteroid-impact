extends Area2D


var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x+=delta*speed

func _on_body_entered(body: Node2D) -> void:
	queue_free()


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	queue_free()
