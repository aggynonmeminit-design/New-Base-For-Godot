extends Node
#Resolution
#Fullscreen
#Max Fps DONE
#Show Fps  DONE

#===================================================================================================
#Variables

@export_category("Nodes")
@export var max_fps_button    : OptionButton
@export var show_fps_button   : CheckBox


var video_settings : Dictionary
var default_values : Dictionary = {}
#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

func _ready() -> void:
	SignalBus.close_settings.connect(_reset_non_applied)
	SignalBus.apply_settings.connect(_update_current)
	
	video_settings = Config._load_settings("VIDEO")
	
	default_values = video_settings
	print(default_values)
	_set_max_fps(0, true)
	_toggle_fps_meter(false, true)
	
#===================================================================================================
#Summ funtions

#_use_value:
#make value default
#check first loading
#	make value new value
#save new value as value
#do thing with value
#set visual to make sense with value

func _set_max_fps(index := 0, first_loading:bool=false) -> void:
	var max_fps: int = video_settings.max_fps
	if !first_loading:
		max_fps = int(max_fps_button.get_item_text(index))
	Config._save_settings("VIDEO", "max_fps", max_fps)
	Engine.max_fps = max_fps
	for i in max_fps_button.item_count: 
		if max_fps_button.get_item_text(i) == str(max_fps):
			max_fps_button.select(i)

func _toggle_fps_meter(toggled_on: bool, first_loading:bool=false) -> void:
	var show_fps: bool = video_settings.show_fps
	if !first_loading:
		show_fps = toggled_on
	Config._save_settings("VIDEO", "show_fps", show_fps)
	SignalBus.emit_signal("toggle_fps_meter", show_fps)
	show_fps_button.button_pressed = show_fps
	
func _reset_non_applied() -> void:
	for key: String in default_values.keys():
		if default_values.get(key) != video_settings.get(key):
			video_settings.set(key, default_values.get(key))

func _update_current()->void:
	default_values = video_settings
	
