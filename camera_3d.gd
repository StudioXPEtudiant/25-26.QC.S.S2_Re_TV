extends Camera3D
@onready var target: Node3D = $"../UAL1_Standard"   # Adjust path if needed
@export var follow_speed: float = 5.0
@export var offset: Vector3 = Vector3(0, 6, 8)

func _process(delta: float) -> void:
	if not target:
		return

	var desired_pos = target.global_transform.origin + offset
	global_transform.origin = global_transform.origin.lerp(desired_pos, delta * follow_speed)

	look_at(target.global_transform.origin, Vector3.UP)
