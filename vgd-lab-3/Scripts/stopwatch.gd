extends Node
class_name Stopwatch

var time = 0.0
var stopped = false
var final_time = 0.0


func _ready():
	add_to_group("stopwatch")  # Add the node to the "stopwatch" group

func _process(delta):
	if stopped:
		return
	time += delta

func reset():
	time = 0.0
	
func stop():
	stopped = true
	final_time = time  # Save the final time

func time_to_string() -> String:
	var sec = int(fmod(time, 60))
	var min = int(time / 60)
	var format_string = "%02d:%02d"
	var actual_string = format_string % [min, sec]
	return actual_string
	
func final_time_to_string() -> String:
	var sec = int(fmod(final_time, 60))
	var min = int(final_time / 60)
	var format_string = "%02d:%02d"
	var actual_string = format_string % [min, sec]
	return actual_string
