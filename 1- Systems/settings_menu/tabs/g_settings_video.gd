extends Node
#Resolution
#Fullscreen
#Max Fps DONE
#Show Fps  DONE

#===================================================================================================
#Variables

@export_category("Nodes")
@export var max_fps_opt_button : OptionButton

var video_settings : Dictionary


#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

func _ready() -> void:
	video_settings = Config._load_settings("VIDEO")
	_set_max_fps(-2)
	
#===================================================================================================
#Summ funtions

func _set_max_fps(index := 0) -> void:
	var max_fps: int = video_settings.max_fps
	if index >= -1:
		max_fps = int(max_fps_opt_button.get_item_text(index))
	Config._save_settings("VIDEO", "max_fps", max_fps)
	Engine.max_fps = max_fps

func _on_check_button_toggled(toggled_on: bool) -> void:
	SignalBus.emit_signal("toggle_fps_meter", toggled_on)
