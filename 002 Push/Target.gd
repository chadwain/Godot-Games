extends Area2D

signal clicked
var mouse_in: bool = false

func _ready():
	self.connect("mouse_entered", self, "_on_mouse_entered")
	self.connect("mouse_exited", self, "_on_mouse_exited")

func _process(_delta):
	if Input.is_action_just_pressed("click") and mouse_in:
		emit_signal("clicked")

func _on_mouse_entered():
	mouse_in = true

func _on_mouse_exited():
	mouse_in = false
