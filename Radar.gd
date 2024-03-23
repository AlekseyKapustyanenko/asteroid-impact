extends Node2D

@onready var asteroidsBase = $"../../Asteroids"
@onready var shipCamera: Camera2D = $"../../Ship".camera
const radarShapeRadius = 225;
const dotRadius = 5
var drawRadius = radarShapeRadius - dotRadius
var dotColor = Color8(255,0,0,100)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	queue_redraw()

func getUnvisibleAsteroids() -> Array:
	return asteroidsBase.get_children().filter(filter)
	
func filter(asteroid)->bool:
	var cameraCenter = shipCamera.get_target_position();
	if(asteroid is Asteroid && asteroid.position.distance_to(cameraCenter)>radarShapeRadius):
		return true
	return false

func _draw() -> void:	
	var asteroids = getUnvisibleAsteroids()
	var cameraCenter = shipCamera.get_screen_center_position();	
	for asteroid in asteroids:
		drawAsteroidDot(asteroid, cameraCenter)

func drawAsteroidDot(asteroid, cameraCenter:Vector2)->void:
	var axteroidPosition = asteroid.position
	var relativePosition = axteroidPosition - cameraCenter
	var alpha = atan(relativePosition.y/relativePosition.x)
	var dotX = drawRadius * cos(alpha)
	var dotY = drawRadius * sin(alpha)
	draw_circle(Vector2(dotX,dotY),dotRadius,dotColor)
