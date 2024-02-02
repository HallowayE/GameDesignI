extends Control


func _on_btn_calc_pressed():
	var eggs = int($LineEdit.text)
	var price = 0.0  # price per copy
	var cost = 0.0   # total cost
	if eggs >= 0 and eggs < 48:
		price = 0.04166666
	elif eggs >= 48 and eggs < 72:
		price = 0.0375
	elif eggs >= 72 and eggs < 132:
		price = 0.033333333
	elif eggs >= 132:
		price = 0.029166666
	else:
		$Label.text = "Invalid # of copies"
		return
	cost = price * eggs
	$Label.text = "Total cost: $%.2f" % cost


func _on_btn_clear_pressed():
	$Label.text = ""
	$LineEdit.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
