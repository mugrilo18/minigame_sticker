extends TextureRect

@export var stickers: Array[Sticker]
@export var rotation_speed: float
@export var orderInfo: ColorRect

var sticker_code:String
var current_order:String

var current_index = 0
var logic_rotation = 0
var ui_dir = 0

var valid = false


func _ready():
	CurrentSticker()

func _process(delta):
	RotateSticker(delta)
	ValidateSticker()


func CurrentSticker():
	logic_rotation = 0
	rotation_degrees = 0
	
	if stickers.is_empty():
		return
	
	var sticker := stickers[current_index]
	if sticker and sticker.sticker_icon:
		texture = sticker.sticker_icon
		sticker_code = sticker.sticker_code


func ValidateSticker():
	var sticker := stickers[current_index]
	var rot_ok := IsRotationValid(sticker)
	var code_ok := sticker_code == current_order
	
	valid = rot_ok and code_ok
	UpdateUI()

func RotateSticker(delta):
	logic_rotation += ui_dir * rotation_speed * delta
	logic_rotation = wrapf(logic_rotation, 0, 360)
	
	rotation_degrees = logic_rotation

func IsRotationValid(sticker: Sticker) -> bool:
	var min_r = sticker.sticker_min_rotation
	var max_r = sticker.sticker_max_rotation

	if min_r <= max_r:
		return rotation_degrees >= min_r and rotation_degrees <= max_r
	else:
		return rotation_degrees >= min_r or rotation_degrees <= max_r

func UpdateUI():
	orderInfo.type_sticker.text = "Tipo: %s" % current_order
	
	if valid:
		orderInfo.validation.color = Color.GREEN
		orderInfo.validation_txt.text = "OK"
	else:
		orderInfo.validation.color = Color.RED
		orderInfo.validation_txt.text = "NOK"
