extends Node

signal all_coins_collected

var score = 0
var coins_remaining = 0

func add_score(points: int) -> void:
	score += points

func set_total_coins(total: int) -> void:
	coins_remaining = total

func coins_collected():
	coins_remaining -= 1
	if coins_remaining <= 0:
		emit_signal("all_coins_collected")

func reset() -> void:
	score = 0
