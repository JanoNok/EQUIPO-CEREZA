extends CharacterBody2D


const ACCELERATION = 5.0
const SPEED = 500
# Get the gravity from the project settings to be synced with RigidBody nodes.
#player = get_tree().get_first_node_in_group("PLAYER")
@onready var boss_1 = $"."
var time = 0
var player
var move_left_right_bool = true
var move_diagonal_negative_bool = true
var move_diagonal_positive_bool = true
var move_circular_bool = true
var type_movement
var dificulty = 1.5

@onready var skeleton = $Skeleton
@export var areaDmg_scene :PackedScene
@onready var attack_timer = $Attack_Timer
@onready var change_movement_timer = $Change_movement_timer

@onready var left_hand = $"Area2D/Body/Left Hand"
@onready var area_2d = $Area2D
var health = 3

func _ready():
	
	player = Controller.player
	attack_timer.connect("timeout",attack)
	attack_timer.start()
	change_movement_timer.connect("timeout", change_movement)
	change_movement_timer.start()
	change_movement()
	area_2d.body_entered.connect(get_hit)

	
func _physics_process(delta):	
	
	time += 0.01
	#global_position =  Vector2(1000*sin(time),400*cos(time))
	movement(type_movement, delta)
	
	
	if Input.is_action_just_pressed("spawn_area"):
		spawn_area()
	var collision_info = move_and_collide(velocity*delta) 
	if collision_info:  
		print("he chocado")
	
func get_hit(obj_velocity):
	
	var normalized_velocity = obj_velocity.normalized()
	
	#Cuando se golpea a la cabeza se mueve un poco 
	
	
	if obj_velocity.length() >= 1500:
		global_position = Vector2(0,0)
		health -=1
		dificulty+=3
		
		print("vida jefe ", health)


func change_movement():
	type_movement = randi_range(0, 2)
	#type_movement = 3
	
func movement(type_movement, delta):
	
	if type_movement == 0:
		move_left_right(delta)
	elif type_movement == 1:
		move_diagonal_positive(delta)
	elif type_movement == 2:
		move_diagonal_positive(delta)
	
func attack():
	spawn_area()
	
	
func move_left_right(delta):
	
	var collision_info = move_and_collide(velocity*delta) 
	if collision_info:  
		move_left_right_bool  = not move_left_right_bool
		
	if move_left_right_bool:
		global_position = global_position + Vector2(100*delta*dificulty, 0)
	else:
		global_position = global_position - Vector2(100*delta*dificulty, 0)

func move_diagonal_negative(delta):
	var collision_info = move_and_collide(velocity*delta) 
	if collision_info:  
		move_diagonal_negative_bool  = not move_diagonal_negative_bool
		
	if move_diagonal_negative_bool:
		global_position = global_position + Vector2(100*delta*dificulty, 100*delta*dificulty)
	else:
		global_position = global_position - Vector2(100*delta*dificulty,100*delta*dificulty)
		
func move_diagonal_positive(delta):
	var collision_info = move_and_collide(velocity*delta) 
	if collision_info:  
		move_diagonal_positive_bool  = not move_diagonal_positive_bool
		
	if move_diagonal_positive_bool:
		global_position = global_position + Vector2(100*delta*dificulty, -100*delta*dificulty)
	else:
		global_position = global_position - Vector2(100*delta*dificulty,-100*delta*dificulty)
	
###
#func move_circular(delta):
#	var collision_info = move_and_collide(velocity*delta) 

#	if collision_info:  
#		move_circular_bool  = not move_circular_bool
#	if move_circular_bool:
#		global_position = Vector2(500*sin(time), 500*cos(time))
#	else:
#		global_position = Vector2(-50*sin(time), -50*cos(time))
###
#Spawnea un area de daño
func spawn_area():
	if not areaDmg_scene:
		return 
	var area = areaDmg_scene.instantiate()
	get_parent().add_child(area)	
	area.global_position = player.global_position


	
	
