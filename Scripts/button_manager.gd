extends Node

@export var sticker: StickerFunctions

func _on_change_btn_button_down() -> void:
	sticker.NextIcon()
