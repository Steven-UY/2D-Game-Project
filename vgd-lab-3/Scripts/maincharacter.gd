#inherits from CharacterBody2D class
extends CharacterBody2D

# Constants for movement
const SWIM_SPEED = 1000  # Adjust this value to make swimming slower
const DRAG = 0.9  # Simulates water resistance (higher value means less inertia)
const BUOYANCY = -30  # Buoyancy to slowly pull player upward when idle

# Reference to the PlayerAnimation node
@onready var player_animation = $PlayerAnimation

func _ready():
	# Automatically play the swim animation when the player spawns
	player_animation.play("swim_up")  # Replace "swim_up" with your animation name

#delta parameter allows behaviour to be unchanged with framerate(check docs)
func _physics_process(delta):
	# Get player input
	var input_direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		input_direction.x += 20
		rotation_degrees = 0  # Rotate right
	if Input.is_action_pressed("move_left"):
		input_direction.x -= 20
		rotation_degrees = 180  # Rotate left
	if Input.is_action_pressed("move_down"):
		input_direction.y += 20
		rotation_degrees = 90  # Rotate downward
	if Input.is_action_pressed("move_up"):
		input_direction.y -= 20
		rotation_degrees = -90  # Rotate upward

	# left key -> down right key -> up down key -> right upkey -> left

	# Normalize input direction to prevent diagonal speed boost(check docs)
	if input_direction.length() > 0:
		input_direction = input_direction.normalized()

	# Apply movement with inertia
	velocity += input_direction * SWIM_SPEED * delta

	# Apply water resistance (drag) to slowly reduce speed over time
	velocity *= DRAG

	# Apply buoyancy if no downward movement
	if input_direction.y == 0:
		velocity.y += BUOYANCY * delta

	# Move the character
	move_and_slide()
