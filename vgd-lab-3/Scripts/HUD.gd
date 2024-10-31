extends CanvasLayer
class_name HUD

@export var stopwatch_label: Label

var stopwatch : Stopwatch

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_stopwatch_label()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stopwatch = get_tree().get_first_node_in_group("stopwatch")

func update_stopwatch_label():
	stopwatch_label.text = stopwatch.time_to_string()
