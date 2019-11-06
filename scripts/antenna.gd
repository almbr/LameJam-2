extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse_pos = Vector2()
var shoot_counter : float = 0 
export var shoot_delta = 3
export var shoot_frequency : float = 1 
export var projectile_speed = 1

# Projectile object scene
var projectile = preload("res://Projectile.tscn")

# Called when the node enters the scene tree for the first time.
#func _ready():
#	antenna = get_tree().get_nodes_in_group("antenna")[0]
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Every shoot_delta:nth delta a projectile is fired
	if shoot_counter >= shoot_delta && Input.is_mouse_button_pressed(BUTTON_LEFT):
		# Perform action
		shoot()
		# Reset
		shoot_counter = 0
	elif shoot_counter < shoot_delta:
		shoot_counter += shoot_frequency/10
		
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
	# Set projectile velocity to speed of projectile_speed and angle of antenna
	var antenna_rotation = self.get_rotation() - 3*PI/4
	var projectile_velocity = Vector2(projectile_speed, projectile_speed).rotated(antenna_rotation) 
	
	# Create projectile and add as child to root
	var p = projectile.instance()
	p.set_position($FirePoint.get_global_position())
	p.init(projectile_velocity)
	get_tree().get_root().add_child(p)