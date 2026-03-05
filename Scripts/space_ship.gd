extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const BOUNDARY_MARGIN = 32  # Padding from edges to prevent sprite from going off-screen
var can_move: bool = true
var direction:int = 1
@export var rotation_speed: float = 5.0

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	var texture = preload("uid://cegjct2b5hhg5")
	setup_collision(texture)

func setup_collision(tex: Texture2D) -> void:
	# 1. Create a Bitmap from the texture
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(tex.get_image())
	
	# 2. Opaque to Polygons: This traces the edges of the visible pixels
	# The 'rect' covers the whole texture
	var polygons = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, tex.get_size()))
	
	# 3. Apply to a CollisionPolygon2D node
	for poly in polygons:
		var collision_poly = CollisionPolygon2D.new()
		collision_poly.polygon = poly
		
		# Center the polygon based on the sprite's offset
		collision_poly.position = -tex.get_size() / 2
		
		add_child(collision_poly)


func _physics_process(delta: float) -> void:
	if can_move == true:
		var x_direction := Input.get_axis("ui_left", "ui_right")
		if x_direction:
			velocity.x = x_direction * SPEED * direction
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		var y_direction := Input.get_axis("ui_up", "ui_down")
		if y_direction:
			velocity.y = y_direction * SPEED * direction
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
		
		move_and_slide()
		
		# Rotate spaceship towards movement direction
		if velocity.length() > 0.1:  # Only rotate when there's significant movement
			var target_rotation = atan2(velocity.x, -velocity.y)
			rotation = lerp(rotation, target_rotation, rotation_speed * delta)
		

		move_and_slide()
	# Clamp the spaceship position to stay within the viewport	
	var viewport_rect = get_viewport_rect()
	position.x = clamp(position.x, BOUNDARY_MARGIN, viewport_rect.size.x - BOUNDARY_MARGIN)
	position.y = clamp(position.y, BOUNDARY_MARGIN, viewport_rect.size.y - BOUNDARY_MARGIN)

func destroy():
	$AnimatedSprite2D.play("crash")
