extends Node2D

func _on_resume_pressed() -> void:
	get_tree().paused=false
	queue_free()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_main_menu_pressed() -> void:
	get_tree().paused=false	
	get_tree().change_scene_to_file("res://MainMenu.tscn")
