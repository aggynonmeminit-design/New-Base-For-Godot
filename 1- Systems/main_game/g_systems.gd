extends Node
#Pause 

#===================================================================================================
#Variables
@export_category("Roots")
@export var pause_root         : Control #PauseRoot
@export var hud_root           : Control #HudRoot
@export var transition_root    : Control #HudRoot

@export_category("Nodes")
@export var pause_menu         : Control #Menu
@export var fps_meter          : Control #FpsMeter


@export_category("Debug")
@export var debug_can_pause    : bool = true #True if game can be paused with _pause_game
@export var debug_can_quit     : bool = true #True if game can be quit with _quit_game
@export var debug_can_show_fps : bool = true #True if game can show fps meter with _toggle_fps_meter

var is_game_paused: bool = false

#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

func _ready() -> void:
	if debug_can_pause:
		SignalBus.pause_game.connect(_pause_game)
	if debug_can_quit:
		SignalBus.quit_game.connect(_quit_game)
	if debug_can_show_fps:
		SignalBus.toggle_fps_meter.connect(_toggle_fps_meter)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("c_Pause"):
		if is_game_paused == true:
			SignalBus.emit_signal("pause_game", false)
		else: 
			SignalBus.emit_signal("pause_game", true)

#===================================================================================================
#Summ funtions

func _pause_game(pause: bool = false) -> void:
	is_game_paused = pause
	get_tree().paused = pause
	pause_menu.visible = true if is_game_paused else false

func _quit_game() -> void:
	get_tree().quit() #ver se não tem problema

func _toggle_fps_meter(toggle: bool = true) -> void:
	fps_meter.visible = true if toggle else false
