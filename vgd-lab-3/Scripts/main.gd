extends Node2D  # Adjust based on your main scene's root node

func _ready():
	var total_coins = get_tree().get_nodes_in_group("Coins").size()
	Global.set_total_coins(total_coins)
	Global.connect("all_coins_collected", Callable(self, "_on_all_coins_collected"))
	
	# Ensure the WinScreen is initially hidden
	var win_screen = $WinScreen  
	win_screen.visible = false

func _on_all_coins_collected():
	var win_screen = $WinScreen 
	win_screen.visible = true
	
	# Optional: Disable player controls
	var player = $Maincharacter  # Adjust the node path if necessary
	player.set_physics_process(false)  # Stops the player's physics processing
