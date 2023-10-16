extends Area2D

@onready var timer = $Timer
	
func destroy():
	#queue.free()
	print("eliminar")
# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_body_entered(body: Node2D):
	print("Entrando al area")
	timer.connect("timeout",destroy)

