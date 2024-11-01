extends CharacterBody2D

var speed = 100
var direction: int = 1  # 1 for right, -1 for left
var max_distance = 70  # Maximum distance to move in one direction
var start_position: Vector2  # Starting position of the character
var health = 10

func _ready() -> void:
	# Store the initial position to calculate distance
	start_position = position
	
func _process(delta: float) -> void:
	# Set the built-in velocity based on direction and speed
	self.velocity.x = direction * speed

	# Use move_and_slide() without arguments to move with collision
	move_and_slide()

	# Calculate distance from the start position
	var distance_moved = position.distance_to(start_position)

	# Reverse direction if the character reaches the max distance
	if distance_moved >= max_distance:
		direction *= -1  # Reverse direction
		start_position = position  # Reset the starting point to the current position
		$AnimatedSprite2D.flip_h = (direction == -1)
