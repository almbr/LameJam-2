extends KinematicBody2D

var vel = Vector2()
const UP = Vector2(0,-1)

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass
	
func init(velocity):
	vel = velocity
	
func _process(_delta):
	vel = move_and_slide(vel, UP)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func die():
	queue_free()