extends Node3D
@onready var anim = $AnimationPlayer
@export var speed: float = 5.0
@export var rotation_speed: float = 100
func _process(delta):
	var direction := Vector3.ZERO

	# Input
	if Input.is_action_pressed("J1up"):
		direction.x += 1
		anim.play ("Sprint")
	if Input.is_action_pressed("J1down"):
		direction.x -= 1
		anim.play ("Sprint")
	if Input.is_action_pressed("J1left"):
		direction.z -= 1
		anim.play ("Sprint")
	if Input.is_action_pressed("J1right"):
		direction.z += 1
		anim.play ("Sprint")

	# Normalisation
	if direction != Vector3.ZERO:
		direction = direction.normalized()

		# Rotation (modèle regardant vers -Z)
		var target_angle := atan2(direction.x, -direction.z)
		rotation.y = lerp_angle(rotation.y, target_angle, rotation_speed * delta)
	else:
		# Pas de rotation si pas de mouvement
		anim.play("Idle")
		pass

	# Mouvement global
	var global_move := transform.basis * direction
	translate(global_move * speed * delta)
