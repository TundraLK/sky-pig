extends Control


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$BestDistanceLabel.text = str(Global.best_distance)
	$TotalCoinsLabel.text = str(Global.total_coins)


func _on_button_pressed() -> void:
	$Timers/SceneChangeTimer.start()


func _on_scene_change_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/level_one.tscn")


func _on_quit_button_pressed() -> void:
	$Timers/QuitTimer.start()



func _on_quit_timer_timeout() -> void:
	get_tree().quit()
