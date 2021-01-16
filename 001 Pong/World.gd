extends Node2D

onready var ball = $Ball
onready var left = $LeftPaddle
onready var right = $RightPaddle

onready var ballPos = ball.position
const ballInitialVel = Vector2(-200, 0)
const ballSpeedIncrease = 10
onready var leftPos = left.position
onready var rightPos = right.position

func _ready():
	randomize()
	ball.velocity = ballInitialVel
	ball.speedIncrease = ballSpeedIncrease

func reset():
	ball.position = ballPos
	ball.velocity = ballInitialVel
	left.position = leftPos
	right.position = rightPos

func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		reset()
