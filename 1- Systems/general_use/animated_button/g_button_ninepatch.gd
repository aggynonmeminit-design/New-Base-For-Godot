@tool
extends NinePatchRect
class_name ButtonNinePatch
#use a margin as parent

#===================================================================================================
#Variables
var patch_sides := [SIDE_BOTTOM, SIDE_LEFT, SIDE_RIGHT, SIDE_TOP]

#===================================================================================================
#Main functions

func _ready() -> void:
	if Engine.is_editor_hint():
		texture = preload("uid://d30sxeuoqikpw")

		for side: Side in patch_sides:
			set_patch_margin(side, 13)
		show_behind_parent = true
		if get_parent():
			get_parent().show_behind_parent = true
