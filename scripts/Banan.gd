extends KinematicBody2D

export var speed = 1
export var damage = 1

var target
var collision_info
var healthnode

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_target()
	healthnode = get_tree().get_nodes_in_group("health")[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var target_position = target.get_position()
	move_towards(target_position)
	
	# When banana collides with object
	if collision_info:
		#print("Collided")
		# If hit by projectile: die
		if collision_info.get_collider().is_in_group("projectile"):
			die()
			
		# If hit antenna	
		elif collision_info.get_collider().is_in_group("antenna"):
			healthnode.take_damage(damage)
			die()

# Moves towards a position. To be called from _process. Should be randomized later.
func move_towards(position):
	var direction = get_position().direction_to(position)
	var velocity = direction*speed
	collision_info = move_and_collide(velocity)

# Returns the banana's target
func get_target():
	# Returns the antenna
	return get_tree().get_nodes_in_group("antenna")[0]
	
func die():
	# Maybe animation?
	queue_free()