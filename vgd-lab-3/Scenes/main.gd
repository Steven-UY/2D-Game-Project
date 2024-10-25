extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Ensure that the player node is positioned at the center of the screen
	var screen_center = get_viewport_rect().size / 2
	$Maincharacter.position = screen_center  # Replace 'Player' with your exact player node name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass  # Remove if you plan to add functionality in _process
