extends StaticBody2D

var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x+=delta*speed


func _on_exploid_area_body_entered(body: Node2D) -> void:
	queue_free()
