extends Control


func _on_btn_calc_pressed():
	$ItemList.add_item("x     y")
	for num in range(-12, 17):
		var y = pow(num, 6) -3*pow(num, 5) -93*pow(num, 4) +87*pow(num, 3) +1596*pow(num, 2) -1380*num -2800
		var line = "%d     %.4f"%[num, y]
		$ItemList.add_item(line)


func _on_btn_clear_pressed():
	$ItemList.clear()


func _on_btn_exit_pressed():
	get_tree().quit()

