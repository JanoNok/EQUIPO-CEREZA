extends CharacterBody2D



const JUMP_VELOCITY = -400.0
const ACCELERATION = 5.0
const SPEED = 500

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):
	# Add the gravity.
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x = Input.get_axis("ui_left", "ui_right")
	if direction_x:
		velocity.x = move_toward(velocity.x, SPEED*direction_x, ACCELERATION)
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION)
		
	var direction_y = Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = move_toward(velocity.y, SPEED*direction_y, ACCELERATION)
	else:
		velocity.y = move_toward(velocity.y, 0, ACCELERATION)
	

	move_and_slide()
