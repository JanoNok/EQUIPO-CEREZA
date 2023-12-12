extends Control

@onready var volver_main_menu = %Volver_main_menu


# Called when the node enters the scene tree for the first time.
func _ready():
	volver_main_menu.pressed.connect(_on_main_menu_pressed)


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
