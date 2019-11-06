extends KinematicBody2D

var vel = Vector2()
var antenna

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass
	
func init(velocity):
	vel = velocity
	
func _process(delta):
	position += vel

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func die():
	queue_free()