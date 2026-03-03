extends Node
class_name GravityDrag

@export var spaceship: Node2D
@export var metereos: Node2D
@export var drag_strength: float = 300.0
@export var enabled:bool = true

func _process(delta: float) -> void:
	if spaceship == null or metereos == null:
		return
	if enabled == true:
		var direction = (metereos.global_position - spaceship.global_position).normalized()
		var drag_force = direction * drag_strength
	
		# Support both CharacterBody2D and Area2D
		if spaceship is CharacterBody2D:
			spaceship.velocity += drag_force
			spaceship.move_and_slide()
		elif spaceship is Area2D:
			spaceship.global_position += drag_force * delta
