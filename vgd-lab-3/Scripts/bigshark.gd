extends CharacterBody2D

var speed = 150
var direction: int = 1  # 1 for right, -1 for left

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Update horizontal position
	position.x += direction * speed * delta

	# Flip the sprite based on direction without affecting scale
	$AnimatedSprite2D.flip_h = (direction == -1)  # Flip when direction is -1

	# Edge detection
	if position.x < 0 or position.x > get_viewport_rect().size.x:
		direction *= -1  # Reverse direction
