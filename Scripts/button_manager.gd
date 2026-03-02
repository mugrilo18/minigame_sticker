extends Node

@export var sticker: TextureRect

func _on_change_btn_button_down() -> void:
	sticker.NextIcon()
