extends Node2D

func _on_resume_pressed() -> void:
	get_tree().paused=false
	queue_free()


func _on_new_game_pressed() -> void:
	get_tree().paused=false	
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
