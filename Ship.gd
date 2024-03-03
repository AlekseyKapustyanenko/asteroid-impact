extends CharacterBody2D


const SPEED = 100.0
const navigationStep = 10;
const positionStep = 2;
@onready var _targetPosition = position;


func _physics_process(delta: float) -> void:	
	var direction := get_direction(_targetPosition.y-position.y)
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)	
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if(Input.is_action_just_pressed("down")):
		_targetPosition.y+=navigationStep
	if(Input.is_action_just_pressed("up")):
		_targetPosition.y-=navigationStep
		var x :=7
		
func get_direction(delta: float) -> int:
	if delta>positionStep:
		return 1
	if delta < -positionStep:
		return -1
	return 0
