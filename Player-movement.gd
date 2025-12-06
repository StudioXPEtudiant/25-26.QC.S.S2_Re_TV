extends RigidBody3D

var Playernumber = 1

var verticaleAxe = 0

var horizontalAxe = 0


@export var movespeed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process (delta:float):
	verticaleAxe = Input.get_axis ("J1up","J1down")
	horizontalAxe = Input.get_axis ("J1left","J1right")
	var direction : Vector3 = Vector3(verticaleAxe,0,horizontalAxe)
	position=position+direction*delta*movespeed
	if direction !=Vector3.ZERO:
		look_at(position-direction)
