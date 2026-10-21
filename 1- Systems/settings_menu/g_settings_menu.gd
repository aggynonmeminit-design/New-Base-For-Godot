extends Control


#===================================================================================================
#Variables
@export_category("Nodes")
@export var tab_container : TabContainer

#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

func _ready() -> void:
	SignalBus.check_applied.connect(_reset_non_applied)
	SignalBus.apply_settings.connect(_update_current)
	SignalBus.close_settings.connect(_reset_current_tab)



#===================================================================================================
#Summ funtions

func _reset_current_tab() -> void:
	tab_container.current_tab = 0

func _reset_non_applied(settings: Dictionary, saved_settings: Dictionary) -> void:
	if saved_settings != settings:
		settings = saved_settings

func _update_current(settings: Dictionary, saved_settings: Dictionary)->void:
	saved_settings = settings
	
