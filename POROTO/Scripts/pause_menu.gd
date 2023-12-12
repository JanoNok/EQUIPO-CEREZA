extends MarginContainer
@onready var resume = $PanelContainer/MarginContainer/VBoxContainer/resume
@onready var retry = $PanelContainer/MarginContainer/VBoxContainer/retry
@onready var backtomain = $PanelContainer/MarginContainer/VBoxContainer/backtomain



# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	
	resume.pressed.connect(_on_resume_pressed)
	retry.pressed.connect(_on_retry_pressed)
	backtomain.pressed.connect(_on_backtomain_pressed)
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		visible = !visible
		get_tree().paused = visible


func _on_resume_pressed():
	visible = false
	get_tree().paused = false
func _on_retry_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
func _on_backtomain_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
