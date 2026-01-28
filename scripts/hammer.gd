extends Area2D

@export var speed : int 
var direction_x : int = -1


func _ready() -> void:
	position = Vector2(1400, randi_range(120, 600))
	

func _physics_process(delta: float) -> void:
	position.x += direction_x * speed * delta
	rotation -= 3 * delta
	


func _on_body_entered(body: Node2D) -> void:
	if "hurt" in body:
		body.hurt()
