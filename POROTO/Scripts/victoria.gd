extends Node2D
@onready var gif_ganar = $Gif_ganar
@onready var volver_a_jugar = $"MarginContainer/HBoxContainer/volver a jugar"
@onready var menu_principal = $"MarginContainer/HBoxContainer/menu principal"



func _ready():
	volver_a_jugar.pressed.connect(_volver_a_jugar)
	menu_principal.pressed.connect(_menu_principal)


func _volver_a_jugar():
	get_tree().change_scene_to_file("res://Scenes/Arena.tscn")


func _menu_principal():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

	
