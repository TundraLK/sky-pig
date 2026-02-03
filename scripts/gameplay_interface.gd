extends Control


func _process(_delta: float) -> void:
	$DistanceCounterLabel.text = str(Global.current_distance, " M")
	$CoinCounterLabel.text = str(Global.current_coins)
