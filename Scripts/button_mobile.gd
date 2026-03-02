extends ColorRect

@export var left_rot_btn:Button
@export var right_rot_btn:Button
@export var confirm_btn:Button
@export var sticker:TextureRect
@export var game:Node2D

func _on_rotation_left_button_down() -> void:
	sticker.ui_dir = -1

func _on_rotation_right_button_down() -> void:
	sticker.ui_dir = 1

func _on_rotation_left_button_up() -> void:
	sticker.ui_dir = 0

func _on_rotation_right_button_up() -> void:
	sticker.ui_dir = 0

func _on_confirm_button_down() -> void:
	game.confirm_sticker = true

func _on_confirm_button_up() -> void:
	game.confirm_sticker = false
