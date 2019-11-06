extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Health_health_depleted():
	# Kill all banan
	var bananas = get_tree().get_nodes_in_group("banan")
	for banan in bananas:
	    banan.queue_free()
	
	# End screne
	get_tree().change_scene("res://DeathScene.tscn")
