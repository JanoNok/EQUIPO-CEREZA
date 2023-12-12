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
var health = 3 :
	set(val):
		if val <= 0:
			die()
		health =val





@onready var label_2 = $MarginContainer/HBoxContainer/Label2
var time_start = Time.get_ticks_msec()
	

func die():
	get_tree().change_scene_to_file("res://Scenes/perdiste.tscn")

func take_damage():
	if health > 0:
		health = max(health - 1, 0)

func can_dash():
	if !dash:
		dash= true;
		audio_dash.play()

func update_time():
	label_2.text = str((Time.get_ticks_msec() - time_start)/1000.0)

func _ready():
	update_time()
	timer.connect("timeout",can_dash)
	Controller.player = self
	
func _physics_process(delta):
	
	update_time()
	# Add the gravity.
		# Llama a la función "_on_timer_timeout" cada 2 segundos
	
	
#	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
#	velocity = velocity.move_toward(SPEED * direction, ACCELERATION)

	var direction_x = Input.get_axis("ui_left", "ui_right")
	if direction_x == 0:
		direction_x = Input.get_accelerometer().normalized().x
	velocity.x = move_toward(velocity.x, SPEED*direction_x, ACCELERATION)

	var direction_y = Input.get_axis("ui_up", "ui_down")
	if direction_y == 0:
		direction_y = -Input.get_accelerometer().normalized().y
	velocity.y = move_toward(velocity.y, SPEED*direction_y, ACCELERATION)

	if Input.is_action_just_pressed("dash") and dash :
		timer.start()
		velocity.x = direction_x*2000
		velocity.y = direction_y*2000
		dash=false
		dash_audio.play()
	
		
	if  velocity.x != 0 or velocity.y !=0:
		#target_angle = atan2(velocity.x, -velocity.y) 
		target_angle = atan2(direction_x, -direction_y) 
		sprite_player.rotation = lerp(target_angle,sprite_player.rotation,0.5)

		#GIRAR LA ANIMACION
		
	var collision_info = move_and_collide(velocity*delta) 
	if collision_info:  
		var collider = collision_info.get_collider()
		var collider_type = collider.get_class()
		if collider_type == "CharacterBody2D":
			collider.get_hit(velocity)
			target_angle = atan2(direction_x, -direction_y) 
			sprite_player.rotation = lerp(target_angle,sprite_player.rotation,0.5)
		
		
			
	# Aquí tienes la instancia del objeto con el que chocó tu CharacterBody2D
	# Puedes usarla para realizar acciones específicas o acceder a sus propiedades
	# Por ejemplo, si necesitas acceder al nombre del nodo:
		
		#print("se encuentra en:". collider.global_position)

		velocity = velocity.bounce(collision_info.get_normal())*0.9
		

		

