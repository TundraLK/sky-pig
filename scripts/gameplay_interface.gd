extends Control


func _process(_delta: float) -> void:
	$DistanceCounterLabel.text = str(Global.current_distance)
	$CoinCounterLabel.text = str(Global.current_coins)
