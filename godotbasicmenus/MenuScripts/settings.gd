extends Node

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://MenuScenes/MainMenu.tscn")
