@warning_ignore("missing_tool")
extends AnimatedButton



func _on_pressed() -> void:
	SignalBus.emit_signal("apply_settings")
