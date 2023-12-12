extends Node2D

@onready var nueva_partida = %Nueva_partida
@onready var tutorial = %Tutorial
@onready var creditos = %Creditos
@onready var salir = %Salir





# Called when the node enters the scene tree for the first time.
func _ready():
	nueva_partida.pressed.connect(_on_start_pressed)
	tutorial.pressed.connect(_on_tutorial_pressed)
	creditos.pressed.connect(_on_creditos_pressed)
	salir.pressed.connect(_on_salir_pressed)

	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Arena.tscn")
	
func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")	

func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://Scenes/creditos.tscn")		
	
func _on_salir_pressed():
	get_tree().quit()
	

