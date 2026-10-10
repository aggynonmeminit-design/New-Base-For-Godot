extends Node
#Resolution
#Fullscreen
#Max Fps DONE

#===================================================================================================
#Variables

@export_category("Nodes")
@export var max_fps_opt_button : OptionButton

#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

#===================================================================================================
#Summ funtions

func _set_max_fps(index := 0) -> void:
	var max_fps := max_fps_opt_button.get_item_text(index)
	Engine.max_fps = int(max_fps)
	
