extends Node2D

@onready var space_ship: CharacterBody2D = $SpaceShip
@onready var matereos: Area2D = $Matereos
@onready var star: Area2D = $Star
@onready var health_bar_x_2d: HealthBarX2D = $HealthBarX2D

@export var damage_per_sec = 0.2

func _ready() -> void:
	health_bar_x_2d.value = health_bar_x_2d.max_value
	space_ship.direction = -1
	
func _process(delta: float) -> void:
	health_bar_x_2d.value -= damage_per_sec
	low_fuel()

func _on_star_body_entered(body) -> void:
	if body == space_ship:
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/Levels/level_1.tscn")

func _on_matereos_body_entered(body) -> void:
	if body == space_ship:
		space_ship.destroy()
		get_tree().call_deferred("reload_current_scene")

func low_fuel():
	if health_bar_x_2d.value == 0:
		space_ship.destroy()
		get_tree().reload_current_scene()
