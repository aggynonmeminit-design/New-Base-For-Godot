@tool
extends NinePatchRect
class_name DebugCheckeredBoard

func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint():
		if !texture:
			texture = preload("uid://b5r4hug1jkhvq")
		if !region_rect:
			region_rect = Rect2(16, 16, 224, 96)
		if axis_stretch_horizontal != AXIS_STRETCH_MODE_TILE:
			axis_stretch_horizontal = NinePatchRect.AXIS_STRETCH_MODE_TILE
			axis_stretch_vertical = NinePatchRect.AXIS_STRETCH_MODE_TILE
		if material != preload("uid://c0bwtie3wp8h6"):
			material = preload("uid://c0bwtie3wp8h6")
