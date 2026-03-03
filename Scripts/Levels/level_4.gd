extends Node2D

@onready var space_ship: CharacterBody2D = $SpaceShip
@onready var matereos: Area2D = $Matereos
@onready var star: Area2D = $Star

@onready var metereo_gravity_drag: GravityDrag = $GravityDrag
@onready var hole_gravity_drag: GravityDrag = $GravityDrag2
@onready var black_hole: Area2D = $"Black Hole"
@onready var health_bar_x_2d: HealthBarX2D = $HealthBarX2D

@export var damage_per_sec:float = 0.2

func _process(delta: float) -> void:
	health_bar_x_2d.value -= damage_per_sec
	low_fuel()

func _ready() -> void:
	health_bar_x_2d.value = health_bar_x_2d.max_value
	metereo_gravity_drag.enabled = true
	hole_gravity_drag.enabled = false
	star.visible = true
	black_hole.visible = false
	black_hole.scale = Vector2(0, 0)

func _on_star_body_entered(body) -> void:
	if body == space_ship:
		space_ship.can_move = false
		metereo_gravity_drag.enabled = false
		star.visible = false
		hole_gravity_drag.enabled = true
		black_hole.visible = true
		var tween = create_tween()
		tween.tween_property(black_hole, "scale", Vector2(1, 1), 0.6) \
			.set_trans(Tween.TRANS_BACK) \
			.set_ease(Tween.EASE_OUT)

func _on_matereos_body_entered(body) -> void:
	if body == space_ship:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_5.tscn")


func _on_black_hole_body_entered(body) -> void:
	if body == space_ship:
		space_ship.destroy()
		get_tree().reload_current_scene()

func low_fuel():
	if health_bar_x_2d.value == 0:
		space_ship.destroy()
		get_tree().reload_current_scene()
