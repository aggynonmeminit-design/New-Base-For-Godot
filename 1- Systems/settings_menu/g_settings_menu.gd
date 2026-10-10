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
	SignalBus.close_settings.connect(_reset_current_tab)
#===================================================================================================
#Summ funtions

func _reset_current_tab() -> void:
	tab_container.current_tab = 0
