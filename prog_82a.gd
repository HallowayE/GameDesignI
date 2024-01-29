extends Control


func _on_btn_calc_pressed():
	var lim = int($lneLimit.text)
	var speed = int($lneSpeed.text)
	var over = speed - lim
	var fine = 0
	if over > 0:
		fine =  20 + ((over) * 5)
	$lblFine.text = "Fine: $%.2f"%fine


func _on_btn_clear_pressed():
	$lblFine.text = "Fine: "
	$lneLimit.text = ""
	$lneSpeed.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
