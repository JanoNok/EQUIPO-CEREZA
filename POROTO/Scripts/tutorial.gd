extends Control

@onready var volver_main_menu = %Volver_main_menu
@onready var next = $Next
@onready var prev = $Prev
var cnt = 0
@onready var tutorial_1 = $tutorial1
@onready var tutorial_2 = $tutorial2
@onready var tutorial_3 = $tutorial3

# Called when the node enters the scene tree for the first time.
func _ready():
	
	prev.hide()
	volver_main_menu.pressed.connect(_on_main_menu_pressed)
	prev.pressed.connect(_on_prev_pressed)
	next.pressed.connect(_on_next_pressed)





func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_prev_pressed():
	cnt-=1
	if cnt==0:
		prev.hide()
		tutorial_1.show()
		
	if cnt==1:
		next.show()
		tutorial_2.show()
	
func _on_next_pressed():
	cnt+=1
	if cnt==1:
		prev.show()
		tutorial_1.hide()
		
	if cnt==2:
		next.hide()
		tutorial_2.hide()

