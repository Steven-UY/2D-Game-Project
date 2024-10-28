extends CharacterBody2D

var speed = 150
var direction: int = 1  # 1 for right, -1 for left

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Update horizontal position
	position.y += direction * speed * delta

	# Edge detection
	if position.y < 0 or position.y > get_viewport_rect().size.y:
		direction *= -1  # Reverse direction
