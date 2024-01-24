extends Control


func _on_btn_show_pressed():
	$Label.text = "My name is Ezra, I was born in Washington state, and I was homeschooled until Sophmore year"


func _on_btn_clear_pressed():
	$Label.text = "-"


func _on_btn_exit_pressed():
	get_tree().quit()
