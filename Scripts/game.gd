extends Node2D

@export var sticker:TextureRect
@export var countdown:Timer
@export var orderInfo:ColorRect
@export var endOrder: ColorRect
@export var mobileBtn: ColorRect

var sticker_rotation
var correct_stickers:int
var wrong_stickers:int
var total_stickers:int
var is_playing:bool
var confirm_sticker = false
var qty_order:int

func _ready() -> void:
	endOrder.timer.timeout.connect(StartGame)
	StartGame()

func _process(_delta: float) -> void:
	EndGame()
	Playing()

func Playing():
	if is_playing == false:
		countdown.stop()
	else:
		orderInfo.coldown_visual.value = countdown.time_left
		
		if confirm_sticker == true:
			confirm_sticker = false
			RandomRotationSticker()
			if sticker.valid == true:
				correct_stickers += 1
				orderInfo.qty_correct.text = str(correct_stickers)
				
				total_stickers -=1
				orderInfo.qty_total.text = str(total_stickers)
				
				countdown.start()
				
			else:
				wrong_stickers += 1
				orderInfo.qty_wrong.text = str(wrong_stickers)
				
				total_stickers -= 1
				orderInfo.qty_total.text = str(total_stickers)
				
				countdown.start()
		
		if total_stickers <= 0:
			EndOrder()

func _on_timer_timeout() -> void:
	wrong_stickers += 1
	orderInfo.qty_wrong.text = str(wrong_stickers)
	
	total_stickers -= 1
	orderInfo.qty_total.text = str(total_stickers)
	
	RandomRotationSticker()
	
	countdown.start()

func RandomRotationSticker():
	sticker_rotation = randi_range(0, 360)
	sticker.logic_rotation = sticker_rotation

func StartGame():
	sticker.current_order = orderInfo.order_type.pick_random()

	is_playing = true
	countdown.start()
	orderInfo.coldown_visual.max_value = countdown.wait_time
	
	total_stickers = randi_range(5, 10)
	orderInfo.qty_total.text = str(total_stickers)

func EndOrder():
	qty_order += 1
	endOrder.visible = true
	endOrder.timer.start()
	is_playing = false
	endOrder.order_progress.text = str("Order ",qty_order, "/3")

func EndGame():
	if qty_order == 3 and endOrder.visible == false:
		get_tree().change_scene_to_file("res://Scenes/result_screen.tscn")
