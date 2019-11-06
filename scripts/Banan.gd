extends KinematicBody2D

export var speed = 100

var target

const UP = Vector2(0,-1)

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_target()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var target_position = target.get_position()
	move_towards(target_position)

# Moves towards a position. To be called from _process. Should be randomized later.
func move_towards(position):
	var direction = get_position().direction_to(position)
	var velocity = direction*speed
	velocity = move_and_slide(velocity, UP)

# Returns the banana's target
func get_target():
	# Returns the antenna
	return get_tree().get_nodes_in_group("antenna")[0]