extends Area2D

#var Metereos := [preload("uid://c4167imsdkooy"), preload("uid://ptw1pjiu8mxx"), preload("uid://bors2scr0bjwk"),preload("uid://4os72yssgig3"), preload("uid://bte7hp37taoj6"), preload("uid://3m81wds1e10c"), preload("uid://brujxqm1ej7dn"), preload("uid://qh4vaivswy2n"), preload("uid://c3efkycai5jkv"), preload("uid://di0qvigdwfird"), preload("uid://r57ir61qrprm"), preload("uid://c2bhl61nac3k6"), preload("uid://cdifo5krdivjq"), preload("uid://njqhr6ayglmu")]
var Metereos := [preload("uid://byxhwrykm6yrs"), preload("uid://bh2ungieg6pts")]

func _ready() -> void:
	if Metereos.size() > 0:
		var texture = Metereos.pick_random()
		$Sprite2D.texture = texture
		$Sprite2D.scale = Vector2(5,5)
		
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
