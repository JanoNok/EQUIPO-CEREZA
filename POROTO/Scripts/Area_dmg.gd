extends Area2D


@onready var timer_warning = $Timer_warning
@onready var timer_delete_area = $Timer_delete_area
@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var BUM = $BUM
@onready var explosion = $Explosion
var time_start = Time.get_ticks_msec()



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
	body.take_damage()


#Funcion que activa el daño del area durante los segundos puestos en timer_delete_area()
func create_dmg_area():
	sprite_2d.texture = null
	sprite_2d.get_child(0).play()
	#sprite_2d.scale = Vector2(4,4)
	#sprite_2d.self_modulate.a = 255
	collision_shape_2d.disabled = false
	body_entered.connect(_on_body_entered)
	timer_warning.stop()
	timer_delete_area.start()
	
	

#Funcion que borra el area cuando pasan los segundos puestos en timer_delete_area()	
func delete():
	timer_delete_area.stop()
	queue_free()

func _physics_process(delta):
	
	timer_delete_area.wait_time = (Time.get_ticks_msec()-time_start)/500.0
	
	#print(timer_delete_area.wait_time, "---------------------------------------------------------\n")
	

