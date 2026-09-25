extends Node

var coins: int = 0
signal coins_changed(new_total)

func add_coin(amount: int = 1) -> void:
	coins += amount
	coins_changed.emit(coins)

func reset_coins() -> void:
	coins = 0
	coins_changed.emit(coins)
