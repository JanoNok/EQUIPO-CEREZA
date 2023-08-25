extends CharacterBody2D

@onready var sprite_player = $SpritePlayer


const ACCELERATION = 10.0
const SPEED = 1000
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var target_angle = 0



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
		
	if Input.is_action_just_pressed("dash"):
		velocity.x = velocity.x*2
		velocity.y = velocity.y*2
		
	if  velocity.x != 0 or velocity.y !=0:
		#target_angle = atan2(velocity.x, -velocity.y) 
		target_angle = atan2(direction_x, -direction_y) 
		sprite_player.rotation = lerp(target_angle,sprite_player.rotation,0.5)
		#GIRAR LA ANIMACION
	




	move_and_slide()
