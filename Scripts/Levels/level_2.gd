extends Node2D

@onready var space_ship: CharacterBody2D = $SpaceShip
@onready var matereos: Area2D = $Matereos
@onready var star: Area2D = $Star

func _on_star_body_entered(body) -> void:
	if body == space_ship:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_3.tscn")

func _on_matereos_body_entered(body) -> void:
	if body == space_ship:
		space_ship.destroy()
		get_tree().reload_current_scene()
