@warning_ignore("missing_tool")
extends AnimatedButton



func _on_pressed() -> void:
	SignalBus.emit_signal("quit_game")
