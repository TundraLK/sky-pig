extends Node

var current_distance : int 
var best_distance : int = 0
var current_coins : int 
var total_coins : int = 0


func _ready(): 
	get_tree().root.content_scale_size = Vector2i(1280, 720)
