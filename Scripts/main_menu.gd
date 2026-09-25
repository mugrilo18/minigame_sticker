extends Control

@export var play_btn: Button
@export var options_btn: Button
@export var quit_btn: Button

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
