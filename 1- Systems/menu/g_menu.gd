extends Control

#===================================================================================================
#Variables
@export var game_menu : MarginContainer
@export var settings_menu : Control

#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

func _ready() -> void:
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
	SignalBus.emit_signal("close_settings")
