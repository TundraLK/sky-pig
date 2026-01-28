extends CharacterBody2D

@export var speed : int 
@export var jump_strength : int 
@export var gravity : int 

enum State {
	RUN,
	JUMP, 
	FALL
}

var state : State


var alive : bool 

signal player_destroyed
signal player_collected

func _ready() -> void:
	alive = true


func _physics_process(delta: float) -> void:
	animations()
	state_handler()
	print(state)
	apply_gravity(delta)
	get_input()
	move_and_slide()


func apply_gravity(delta):
	velocity.y += gravity * delta


func get_input():
	if alive == true:
		if Input.is_action_pressed("jump"):
			velocity.y += -jump_strength 

func state_handler():
	if is_on_floor() and state != State.RUN:
		state = State.RUN
	else:
		if velocity.y < -0.1 and state != State.JUMP:
			state = State.JUMP
		elif velocity.y > 0.1 and state != State.FALL:
			state = State.FALL

func animations():
	match state:
		State.RUN:
			$Run.play()
			$Run.show()
			$Fall.hide()
			$Jump.hide()
		State.JUMP:
			$Jump.play()
			$Jump.show()
			$Fall.hide()
			$Run.hide()
		State.FALL:
			$Fall.play()
			$Fall.show()
			$Run.hide()
			$Jump.hide()


func hurt():
	player_destroyed.emit()
	

func collect():
	player_collected.emit()
