extends CharacterBody2D

@onready var sprite_player = $SpritePlayer


const ACCELERATION = 10.0
const SPEED = 1000
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var target_angle = 0
@onready var timer = $Timer
var dash =true
@onready var audio_dash = $Can_dash_audio
@onready var dash_audio = $Dash_audio

func can_dash():
	
	if !dash:
		dash= true;
		audio_dash.play()
	
	

func _ready():
	
	timer.connect("timeout",can_dash)
	
	
func _physics_process(delta):
	# Add the gravity.
		# Llama a la función "_on_timer_timeout" cada 2 segundos
	
	var direction_x = Input.get_axis("ui_left", "ui_right")
	if direction_x:
		velocity.x = move_toward(velocity.x, SPEED*direction_x, ACCELERATION)
	else:
		velocity.x = move_toward(velocity.x, Input.get_accelerometer().normalized().x*SPEED, ACCELERATION)
	
	var direction_y = Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = move_toward(velocity.y, SPEED*direction_y, ACCELERATION)
	else:
		velocity.y = move_toward(velocity.y, Input.get_accelerometer().normalized().y*SPEED, ACCELERATION)

	if (Input.is_action_just_pressed("dash") or  ) and dash :
		timer.start()
		velocity.x = direction_x*800
		velocity.y = direction_y*800
		dash=false
		dash_audio.play()
		
	
		
	
		
	if  velocity.x != 0 or velocity.y !=0:
		#target_angle = atan2(velocity.x, -velocity.y) 
		target_angle = atan2(direction_x, -direction_y) 
		sprite_player.rotation = lerp(target_angle,sprite_player.rotation,0.5)

		#GIRAR LA ANIMACION
		
	var collision_info = move_and_collide(velocity*delta) 
	if collision_info:  
		velocity = velocity.bounce(collision_info.get_normal())*0.9
		

