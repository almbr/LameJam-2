extends Area2D

# This area spawns bananas
var centerpos
var size = Vector2()
var positionInArea = Vector2()

var banan = preload("res://Banan.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	centerpos = $Shape.get_position() + self.get_position()
	size = $Shape.shape.extents
	print("Centerpos: ", centerpos)
	print("Size: ", size)

# Spawn banana
func _on_Spawntimer_timeout():
	positionInArea.x = (randi() % int(size.x)) - (size.x/2) + centerpos.x
	positionInArea.y = (randi() % int(size.y)) - (size.y/2) + centerpos.y

	var spawn = banan.instance()
	spawn.position = positionInArea
	get_tree().get_root().add_child(spawn)
