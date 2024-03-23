extends Node2D

func _ready() -> void:
	get_tree().paused=false
	$HomePlanet.health=9223372036854775807


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_instructions_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Instructions.tscn")
