extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var healthnode

# Called when the node enters the scene tree for the first time.
func _ready():
	healthnode = get_tree().get_nodes_in_group("health")[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Interface_health_changed(health):
	text = str(healthnode.health)