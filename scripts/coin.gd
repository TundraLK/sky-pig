extends Area2D

@export var speed : int
var direction_x : int = -1

func _ready() -> void:
	position = Vector2(1350, randi_range(100, 620))
	

func _physics_process(delta: float) -> void:
	position.x += direction_x * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if "collect" in body:
		Global.current_coins += 1
		body.collect()
		print(body)
		$CollectedTimer.start()


func _on_collected_timer_timeout() -> void:
	queue_free()
