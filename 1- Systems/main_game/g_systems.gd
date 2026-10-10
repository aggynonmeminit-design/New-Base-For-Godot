extends Node
#Pause 

#===================================================================================================
#Variables
@export_category("Nodes")
@export var pause_root: Control #PauseRoot

@export_category("Debug")
@export var debug_can_pause : bool = true #True if game can be paused with _pause_game
@export var debug_can_quit  : bool = true #True if game can be quit with _quit_game


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
	match is_game_paused:
		true:
			pause_root.show()
		false:
			pause_root.hide()
		_:
			Global._push_weird(self)

func _quit_game() -> void:
	get_tree().quit() #ver se não tem problema
