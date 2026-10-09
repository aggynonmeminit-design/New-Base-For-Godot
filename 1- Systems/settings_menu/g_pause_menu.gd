extends Control

#===================================================================================================
#Variables

const T_SETTINGS_MENU = preload("uid://vsf8npyq7ju5")


#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

func _ready() -> void:
	SignalBus.open_settings.connect(_open_settings)
	SignalBus.close_settings.connect(_close_settings)
#===================================================================================================
#Summ funtions

func _open_settings(sender: Node) -> void:
	var settings_menu_ins := T_SETTINGS_MENU.instantiate()
	var grandpa := sender.get_parent().get_parent() 
	if grandpa.has_method("hide"):
		grandpa.hide()
	sender.owner.add_child(settings_menu_ins)
	
func _close_settings(sender: Node) -> void:
	var settings_menu_ins := T_SETTINGS_MENU.instantiate()
	var grandpa := sender.get_parent().get_parent() 
	if grandpa.has_method("show"):
		grandpa.show()
	sender.owner.remove_child(settings_menu_ins)
