extends Node2D
@onready var this = $"."
@onready var sprite_2d = $Area2D/Sprite2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var timer = $Timer
var player: CharacterBody2D
@onready var area_2d = $Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	area_2d.connect("body_entered",enter_body)
	player = get_tree().get_first_node_in_group("Player")
	timer.connect("timeout",change_visibility)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x +=3
	print("posicion:", player.position.x)
	pass
	
func change_visibility():
	
	sprite_2d.visible = !sprite_2d.visible


func enter_body(body:Node2D):
	if body.is_in_group("Player"):
		print("hola")
	
