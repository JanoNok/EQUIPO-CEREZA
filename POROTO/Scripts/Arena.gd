extends Node2D

@onready var arena_music = $Arena_music
# Called when the node enters the scene tree for the first time.
func _ready():
	arena_music.play()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
