extends Node
#Resolution
#Fullscreen
#Max Fps DONE
#Show Fps  DONE

#===================================================================================================
#Variables

@export_category("Nodes")
@export var max_fps_opt_button : OptionButton

#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

func _ready() -> void:
	pass
	
#===================================================================================================
#Summ funtions

func _set_max_fps(index := 0) -> void:
	var max_fps := max_fps_opt_button.get_item_text(index)
	Engine.max_fps = int(max_fps)

func _on_check_button_toggled(toggled_on: bool) -> void:
	SignalBus.emit_signal("toggle_fps_meter", toggled_on)
