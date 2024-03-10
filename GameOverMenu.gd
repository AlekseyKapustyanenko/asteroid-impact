extends CanvasLayer

@export var score=0

func _ready() -> void:
	$ScoreValue.text=str(score)

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu.tscn")
	queue_free()


func _on_quit_pressed() -> void:
	get_tree().quit()
