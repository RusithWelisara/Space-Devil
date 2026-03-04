extends Node
class_name Float

@export var star: Node

@export var float_height: float = 20.0
@export var float_duration: float = 1.5   

@export var pulse_speed: float = 3.0
@export var pulse_amount: float = 0.1
@export var rotation_speed: float = 0.5

var time_passed: float = 0.0


func _ready():
	if star == null:
		return
	
	var tween = create_tween().set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	
	tween.tween_property(star, "position:y", star.position.y - float_height, float_duration)
	tween.tween_property(star, "position:y", star.position.y + float_height, float_duration)


func _process(delta: float) -> void:
	if star == null:
		return
	
	time_passed += delta
	
	# Slight rotation
	star.rotation += rotation_speed * delta
	
	# Pulse scale
	var scale_offset = 1.0 + sin(time_passed * pulse_speed) * pulse_amount
	star.scale = Vector2(scale_offset, scale_offset)
