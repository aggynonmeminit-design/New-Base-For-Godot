extends Node
#Pause 

#===================================================================================================
#Variables
@export var pause_root: Control #PauseRoot

var is_game_paused: bool = false

#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

func _ready() -> void:
	SignalBus.pause_game.connect(_game_pause)
	SignalBus.quit_game.connect(_quit_game)

	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("c_Pause"):
		if is_game_paused == true:
			SignalBus.emit_signal("pause_game", false)
		else: 
			SignalBus.emit_signal("pause_game", true)
#===================================================================================================
#Summ funtions

func _game_pause(pause: bool = false) -> void:
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
