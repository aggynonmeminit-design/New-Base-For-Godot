extends Node

#===================================================================================================
#Variables

var config: ConfigFile = ConfigFile.new()
var SETTINGS_FILE_PATH: String = "user://settings.ini"

#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functionss

func _ready() -> void: 
	SignalBus.apply_settings.connect(_apply_settings)
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		#Keybinding
		config.set_value("KEYBINDING", "c_Walk_up", "W")
		config.set_value("KEYBINDING", "c_Walk_down", "S")
		config.set_value("KEYBINDING", "c_Walk_left", "A")
		config.set_value("KEYBINDING", "c_Walk_right", "D")
		config.set_value("KEYBINDING", "c_Pause", "Escape")
		config.set_value("KEYBINDING", "c_Run", "Shift")
		
		#Video
		config.set_value("VIDEO", "show_fps", false)
		config.set_value("VIDEO", "max_fps", 60)
		config.set_value("VIDEO", "resolution", "640x360")
		config.set_value("VIDEO", "fullscreen", true)
		
		#Audio
		config.set_value("AUDIO", "master_volume", 100)
		config.set_value("AUDIO", "music_volume", 100)
		config.set_value("AUDIO", "sfx_volume", 100)
		config.set_value("AUDIO", "muted", false)
		
		config.save(SETTINGS_FILE_PATH)
	else:
		config.load(SETTINGS_FILE_PATH)


#===================================================================================================
#Summ funtions

@warning_ignore("untyped_declaration")
func _save_settings(section: String, key : String, value, apply_instantly: bool = false) -> void:
	config.set_value(section, key, value)
	if apply_instantly:
		config.save(SETTINGS_FILE_PATH)

func _load_settings(section: String = "GENERAL") -> Dictionary:
	var section_settings : Dictionary = {}
	for key in config.get_section_keys(section):
		section_settings[key] = config.get_value(section, key)
	return section_settings

func _apply_settings() -> void:
	config.save(SETTINGS_FILE_PATH)
	
