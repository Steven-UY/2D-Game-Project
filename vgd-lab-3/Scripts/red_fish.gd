extends CharacterBody2D

const speed = 300

func _ready():
	# Initialize the velocity based on speed and direction

func _physics_process(delta):
	# Apply movement in the specified direction
	position=speed
	
	# Optional: Remove the fish if it goes off-screen
	if position.x < -100 or position.x > 1000:
		queue_free()
