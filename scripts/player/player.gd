extends CharacterBody2D
class_name Player

@onready var sprite = $AnimatedSprite2D
@onready var fsm = $FSM
@onready var input = $InputHandler

const AIR_MULTIPLIER = 0.7
const MAX_SPEED = 90.0
const ACCELERATION = 900

const JUMP_GRAVITY = 900.0
const FALL_GRAVITY = 500.0
const TERMINAL_VELOCITY = 180.0

var direction: 
	get: return direction
	set(value):
		if value == 0 or value == direction: return
		direction = value
		sprite.flip_h = value == -1

func _ready():
	fsm.change_state("idle")

func _physics_process(delta):
	input.update()
	fsm.physics_update(delta)
