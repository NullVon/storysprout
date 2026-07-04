extends CharacterBody2D

# Fixed player movement speed in pixels per second.
const SPEED := 200.0

# The interactable object currently within reach.
var current_interactable: Area2D = null

func _ready() -> void:
	print("Player ready.")
	print("InteractionArea found: ", $InteractionArea)

	$InteractionArea.area_entered.connect(_on_interaction_area_area_entered)
	$InteractionArea.area_exited.connect(_on_interaction_area_area_exited)

# Runs every frame.
func _process(delta: float) -> void:
	var direction := get_movement_direction()
	move_player(direction, delta)
	
	if Input.is_action_just_pressed("interact") and current_interactable != null:
		current_interactable.interact()

# Reads keyboard input and converts it into a movement direction.
func get_movement_direction() -> Vector2:
	var direction := Vector2.ZERO

	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_S):
		direction.y += 1
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1

	# Prevents diagonal movement from being faster than straight movement.
	return direction.normalized()

# Moves the player using the chosen direction and frame time.
func move_player(direction: Vector2, delta: float) -> void:
	position += direction * SPEED * delta
	
# Stores the object when the player enters its interaction area.
func set_current_interactable(interactable: Area2D) -> void:
	current_interactable = interactable
	print("Can interact with: ", interactable.name)

# Clears the object when the player leaves its interaction area.
func clear_current_interactable(interactable: Area2D) -> void:
	if current_interactable == interactable:
		current_interactable = null
		print("No longer interacting with: ", interactable.name)



# Triggered when an interactable enters the player's interaction range.
func _on_interaction_area_area_entered(area: Area2D) -> void:
	print("ENTERED:", area.name)
	set_current_interactable(area)

# Triggered when an interactable leaves the player's interaction range.
func _on_interaction_area_area_exited(area: Area2D) -> void:
	print("EXITED:", area.name)
	clear_current_interactable(area)
