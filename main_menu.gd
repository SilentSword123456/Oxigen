extends Control

@onready var play_button: Button = $Center/Menu/Play
@onready var quit_button: Button = $Center/Menu/Quit


func _ready() -> void:
	quit_button.visible = not OS.has_feature("web")
	if not quit_button.visible:
		play_button.focus_neighbor_bottom = play_button.get_path()
		play_button.focus_next = play_button.get_path()
		play_button.focus_previous = play_button.get_path()
	play_button.grab_focus()


func _on_play_pressed() -> void:
	play_button.disabled = true
	Global.reset_coins()
	var error := get_tree().change_scene_to_file("res://main.tscn")
	if error != OK:
		$Center/Menu/Error.show()
		play_button.disabled = false
		play_button.grab_focus()


func _on_quit_pressed() -> void:
	get_tree().quit()
