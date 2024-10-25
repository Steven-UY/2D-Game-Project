extends CharacterBody2D

const redFishSpeed = 300

func _ready():
	# Set initial velocity to move the fish left
	velocity.x = -redFishSpeed

func _physics_process(delta: float) -> void:
	# Move the fish using the velocity set in _ready()
	move_and_slide()

	# Optional: Remove the fish if it goes off-screen
	if position.x < -100 or position.x > 1000:
		queue_free()
