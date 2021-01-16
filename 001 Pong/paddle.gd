extends StaticBody2D

const speed = 240
onready var screen_y = get_viewport_rect().size.y
onready var down = name.to_lower() + "_down"
onready var up = name.to_lower() + "_up"

func _process(delta):
	var n = name.to_lower()
	var input = Input.get_action_strength(down) - Input.get_action_strength(up)
	position.y = clamp(position.y + input * speed * delta, 40, screen_y - 40)
	
