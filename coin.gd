extends Area2D

func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.add_coin(1)
		queue_free()
