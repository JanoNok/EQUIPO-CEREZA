extends Node2D
@onready var gif_ganar = $Gif_ganar

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Arena.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
