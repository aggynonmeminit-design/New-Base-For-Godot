extends Control

#===================================================================================================
#Variables
@export_category("Nodes")
@export var game_menu     : MarginContainer
@export var settings_menu : Control
@export var tab_container : TabContainer 
#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

func _ready() -> void:
	tab_container = settings_menu.tab_container
	SignalBus.open_settings.connect(_open_settings)
	SignalBus.close_settings.connect(_close_settings)

func _on_pressed(what: String) -> void:
	match what:
		"Resume":
			SignalBus.emit_signal("pause_game", false)
		"Quit":
			SignalBus.emit_signal("quit_game")
		"Settings":
			SignalBus.emit_signal("open_settings")
#===================================================================================================
#Summ funtions

func _open_settings() -> void:
	if game_menu.has_method("hide"):
		game_menu.hide()
	if settings_menu.has_method("show"):
		settings_menu.show()
	
func _close_settings() -> void:
	if game_menu.has_method("show"):
		game_menu.show()
	if settings_menu.has_method("hide"):
		settings_menu.hide()

func _on_visibility_changed() -> void:
	await ready
	var tab     : MarginContainer = tab_container.get_current_tab_control()
	@warning_ignore("untyped_declaration")
	var settings : Array = tab.get_child(0).settings
	var default  : Dictionary = settings.get(0)
	var saved    : Dictionary = settings.get(1)
	SignalBus.emit_signal("check_applied", default, saved)
