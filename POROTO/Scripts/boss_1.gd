extends CharacterBody2D


const SPEED = 1.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#player = get_tree().get_first_node_in_group("PLAYER")
@onready var boss_1 = $"."

var player
@onready var skeleton = $Skeleton
@export var areaDmg_scene :PackedScene
@onready var attack_timer = $Attack_Timer
@onready var left_hand = $"Area2D/Body/Left Hand"
@onready var area_2d = $Area2D
var health = 3

func _ready():
	
	player = Controller.player
	attack_timer.connect("timeout",attack)
	attack_timer.start()
	area_2d.body_entered.connect(get_hit)
	
func get_hit(obj_velocity):
	
	var normalized_velocity = obj_velocity.normalized()
	
	#Cuando se golpea a la cabeza se mueve un poco 
	global_position += normalized_velocity*25
	if obj_velocity.length() >= 1500:
		health -=1
		
		print("vida jefe ", health)
	
func _physics_process(delta):	
		
	global_position +=  Vector2(2,0)
	global_position[0] = int(global_position[0])%1000
	
	#left_hand.global_transform.origin.x += player.get_position_delta()[0]
	if Input.is_action_just_pressed("spawn_area"):
		spawn_area()
	

func attack():
	spawn_area()
	
#Spawnea un area de daño
func spawn_area():
	if not areaDmg_scene:
		return 
	var area = areaDmg_scene.instantiate()
	get_parent().add_child(area)	
	area.global_position = player.global_position


	
	
