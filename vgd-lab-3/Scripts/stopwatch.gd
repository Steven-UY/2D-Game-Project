extends Node
class_name Stopwatch

var time = 0.0
var stopped = false


func _ready():
	add_to_group("stopwatch")  # Add the node to the "stopwatch" group

func _process(delta):
	if stopped:
		return
	time += delta

func reset():
	time = 0.0

func time_to_string() -> String:
	var sec = int(fmod(time, 60))
	var min = int(time / 60)
	var format_string = "%02d:%02d"
	var actual_string = format_string % [min, sec]
	return actual_string
