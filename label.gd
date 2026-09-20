extends Label

func _ready() -> void:
	Global.coins_changed.connect(_on_coins_changed)
	text = "Coins: %d" % Global.coins

func _on_coins_changed(new_total: int) -> void:
	text = "Coins: %d" % new_total
