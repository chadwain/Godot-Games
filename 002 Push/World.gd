extends Node2D

onready var points_text = $Points
onready var target = $Target1
onready var target_sprite = $Target1/Sprite

var time: float = 0
var points: int = 0

func _ready():
	randomize()
	target.connect("clicked", self, "circle_click")
	reset()

func _process(delta):
	if Input.is_action_just_pressed("reset"):
		reset()
		return
		
	target_sprite.set_rotation(time * 1.5)
	time += delta

func reset():
	target_sprite.set_rotation(0)
	time = 0
	points_text.set_text("0")
	points = 0
	new_circle()

func circle_click():
	points += 1
	points_text.set_text(String(points))
	new_circle()

func new_circle():
	# New position
	target.position = randposition()
	
	# New size
	var new_scale = randf() * 6 + 1
	target.set_scale(Vector2(new_scale, new_scale))
	
	# New color
	var target_shader = target_sprite.get("material") as ShaderMaterial
	target_shader.set_shader_param("base_color", Color(randcolor(), randcolor(), randcolor(), 1.0))

func randposition():
	var screen_size = get_viewport_rect().end
	var x = randi() % int(screen_size.x - 60) + 30
	var y = randi() % int(screen_size.y - 40) + 20
	return Vector2(x, y)

func randcolor():
	return randf() * 0.7 + 0.3
