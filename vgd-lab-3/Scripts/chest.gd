extends Node2D
const GOLD_COIN = preload("res://Scenes/GoldCoin.tscn")
var is_open = false
# maincharacter.gd
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play('default')
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	#$AnimatedSprite2D.play('open')
	if not is_open and body.is_in_group("Player"): 
		is_open = true  
		$AnimatedSprite2D.play('open')
		


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation =="open":
		var newcoin = GOLD_COIN.instantiate()
		print("coin")
		#add_child(newcoin)
		call_deferred("add_child", newcoin)
