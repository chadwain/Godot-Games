extends KinematicBody2D

var speedIncrease: float
var velocity: Vector2

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var velocity_normal_space = velocity.rotated(-collision.normal.angle())
		velocity_normal_space.x *= -1;
		var sb2d = collision.collider as StaticBody2D
		if sb2d.name.ends_with("Paddle"):
			var new_angle = clamp(velocity_normal_space.angle() + (randf() * TAU - PI) * 0.07, -TAU / 8, TAU / 8)
			velocity_normal_space = Vector2(velocity.length() + speedIncrease, 0).rotated(new_angle)
		velocity = velocity_normal_space.rotated(collision.normal.angle())
