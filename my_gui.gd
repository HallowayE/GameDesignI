extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	self.process_mode = Node.PROCESS_MODE_ALWAYS


func _on_btn_resume_pressed():
	hide()
	get_tree().paused = false


func _on_btn_quit_pressed():
	get_tree().quit()
