extends Node2D

var hammer_scene : PackedScene = preload("res://scenes/hammer.tscn")
var coin_scene : PackedScene = preload("res://scenes/coin.tscn")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Global.current_distance = 0
	Global.current_coins = 0


func _on_hammer_spawn_timer_timeout() -> void:
	var hammer = hammer_scene.instantiate()
	$Hazards.add_child(hammer)


func _on_player_player_destroyed() -> void:
	if Global.current_distance > Global.best_distance:
		Global.best_distance = Global.current_distance
	if Global.current_coins > Global.total_coins:
		Global.total_coins = Global.current_coins
	$Timers/SceneChangeTimer.start()


func _on_player_player_collected() -> void:
	pass #update GUI


func _on_coin_timer_timeout() -> void:
	var coin = coin_scene.instantiate()
	$Items.add_child(coin)


func _on_scene_change_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


func _on_distance_timer_timeout() -> void:
	Global.current_distance += 1
