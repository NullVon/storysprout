extends CharacterBody2D

# The player's movement speed in pixels per second.
# We use a variable instead of typing "200" everywhere.
var speed := 200.0


# Runs once when the player enters the scene.
func _ready() -> void:

	print("Hello StorySprout!")

	# Start near the left side of the screen.
	#
	# Vector2(x, y)
	# x = left/right
	# y = up/down
	position = Vector2(100, 300)

	# Wait 0.2 seconds, then continue executing.
	await get_tree().create_timer(0.20).timeout
	position += Vector2(60, 0)

	await get_tree().create_timer(0.20).timeout
	position += Vector2(0, -60)

	await get_tree().create_timer(0.20).timeout
	position += Vector2(60, 0)

	await get_tree().create_timer(0.20).timeout
	position += Vector2(0, 60)


# Runs every frame while the game is running.
func _process(delta: float) -> void:

	# Start with no movement.
	var direction := Vector2.ZERO

	# Update the direction based on which keys are being held.
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_S):
		direction.y += 1
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1

	# Move the player.
	#
	# normalized() keeps diagonal movement the same speed.
	# delta keeps movement consistent regardless of frame rate.
	position += direction.normalized() * speed * delta
