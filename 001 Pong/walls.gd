extends Area2D

func _ready():
	self.connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body.name == "Ball":
		print("loss!")
