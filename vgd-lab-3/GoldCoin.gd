extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Coins")  # Add this coin to the "Coins" group


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass

func _on_area_2d_body_entered(_body: CharacterBody2D) -> void:
	if _body.is_in_group('Player'):
		Global.add_score(5)
		Global.coins_collected()
		Global.reset()
		queue_free()
