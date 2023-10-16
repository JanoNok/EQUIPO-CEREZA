extends CharacterBody2D


const SPEED = 1.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#player = get_tree().get_first_node_in_group("PLAYER")

var player
@onready var skeleton = $Skeleton
@onready var left_hand = $"Skeleton/Head/Left Arm1/Left Arm2/Left Hand"
@onready var right_hand = $"Skeleton/Head/Right Arm1/Right Arm2/Right Hand"
@export var areaDmg_scene :PackedScene

func _ready():
	player = Controller.player
	


func _physics_process(delta):
	
	#left_hand.global_transform.origin.x += player.get_position_delta()[0]
	if Input.is_action_just_pressed("spawn_area"):
		spawn_area()
	
		
	if Input.is_action_just_pressed("dash"):
		pass
		#print(player.get_position_delta()[0]*SPEED*delta)
		#left_hand.move_global_x(player.get_position_delta()[0])
		#print(player.get_position_delta()[1]*SPEED*delta)
		#left_hand.move_global_y(player.get_position_delta()[1])
		
	#print(player.get_position_delta()[0])
	
#Spawnea un area de daño
func spawn_area():
	if not areaDmg_scene:
		return 
	
	var area = areaDmg_scene.instantiate()
	get_parent().add_child(area)
	area.global_position = player.global_position
	
	
