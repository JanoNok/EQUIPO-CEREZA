extends Area2D


@onready var timer_warning = $Timer_warning
@onready var timer_delete_area = $Timer_delete_area
@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D

var right_arm
# Called when the node enters the scene tree for the first time.
func _ready():
	
	timer_warning.connect("timeout",create_dmg_area)
	timer_delete_area.connect("timeout", delete)
	timer_warning.start()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Funcion que se ejcuta cuando entra un objeto al area	
func _on_body_entered(body: Node2D):
	print(body.health)
	body.take_damage()
	print(body.health)

func innit(body: Node2D):
	
	
	pass
	
#Funcion que activa el daño del area durante los segundos puestos en timer_delete_area()
func create_dmg_area():
	sprite_2d.texture = preload("res://Images/circulodaño.png")
	collision_shape_2d.disabled = false
	body_entered.connect(_on_body_entered)
	timer_warning.stop()
	timer_delete_area.start()

#Funcion que borra el area cuando pasan los segundos puestos en timer_delete_area()	
func delete():
	timer_delete_area.stop()
	queue_free()
	
	

