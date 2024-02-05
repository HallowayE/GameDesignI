extends Control


func _on_btn_calc_pressed():
	$ItemList.add_item("Number     Square     Square Root")
	for num in range(1, 51):
		var numsquare = pow(num, 2)
		var numroot = pow(num, 0.5)
		var line = "%d     %d     %.4f"%[num, numsquare, numroot]
		$ItemList.add_item(line)


func _on_btn_clear_pressed():
	$ItemList.clear()


func _on_btn_exit_pressed():
	get_tree().quit()
