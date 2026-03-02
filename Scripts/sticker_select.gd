extends ColorRect

@export var animation: AnimationPlayer
@export var sticker_info: TextureRect
@export var sticker_code: Array[Label]
@export var sticker_icon: Array[TextureRect]

var is_open = false

func _ready() -> void:
	for i in sticker_code.size():
		sticker_code[i].text = sticker_info.stickers[i].sticker_code
		sticker_icon[i].texture = sticker_info.stickers[i].sticker_icon

func _on_change_btn_button_down() -> void:
	is_open = !is_open
	animation.play("open" if is_open else "close")

func select_sticker(index: int) -> void:
	if index < 0 or index >= sticker_info.stickers.size():
		return
	
	sticker_info.current_index = index
	sticker_info.CurrentSticker()
