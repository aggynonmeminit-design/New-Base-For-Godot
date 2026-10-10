extends Control

@export_category("Nodes")
@export var label : RichTextLabel

func _physics_process(delta: float) -> void:
	label.text = "Fps: %d" %Engine.get_frames_per_second()
