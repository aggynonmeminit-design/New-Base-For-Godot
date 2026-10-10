extends Area2D


func _on_body_entered(body: RigidBody2D) -> void:
	body.linear_velocity = Vector2(body.linear_velocity.x, -body.linear_velocity.y) 


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.linear_velocity = Vector2(-body.linear_velocity.x, body.linear_velocity.y) 
