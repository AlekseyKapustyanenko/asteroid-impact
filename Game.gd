extends Node2D

var shipHp:int
var planetHp:int
var scores=0;
var pauseMenuPreload = preload("res://PauseMenu.tscn")
var gameOverMenuPreload=preload("res://GameOverMenu.tscn")

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

func _notification(what: int) -> void:
	if(what == NOTIFICATION_WM_GO_BACK_REQUEST):
		pause()

func pause():
	get_tree().paused=true
	var pauseMenu = pauseMenuPreload.instantiate()
	add_child(pauseMenu)
	


func _on_ship_on_ship_death() -> void:
	gameOver()

func gameOver():
	$HUD.visible=false
	var gameOver=gameOverMenuPreload.instantiate()
	gameOver.score=scores
	add_child(gameOver)


func _on_home_planet_on_planet_death() -> void:
	gameOver()
