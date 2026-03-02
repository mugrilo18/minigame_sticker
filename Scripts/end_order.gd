extends ColorRect

@export var timer: Timer
@export var coldown: ProgressBar
@export var order_progress: Label

func _ready() -> void:
	coldown.max_value = timer.wait_time

func _process(_delta: float) -> void:
	coldown.value = timer.time_left
	

func _on_timer_timeout() -> void:
	visible = false
