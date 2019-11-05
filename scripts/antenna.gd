extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse_pos = Vector2()
var shoot_counter : float = 0 
export var shoot_delta = 3

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Every shoot_delta:nth delta a projectile is fired
	if shoot_counter >= shoot_delta && Input.is_mouse_button_pressed(BUTTON_LEFT):
		# Perform action
		shoot()
		# Reset
		shoot_counter = 0
	elif shoot_counter < 3:
		shoot_counter += delta
		
# Called upon input event
func _input(event):
	# Mouse in viewport coordinates
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.is_doubleclick():
				mouse_pos = get_viewport().get_mouse_position()
				var angle = self.global_position.angle_to_point(mouse_pos)
				self.set_rotation(angle-PI/2)

# Shoots a projectile in the current angle
func shoot():
	print("Shoot")
	pass