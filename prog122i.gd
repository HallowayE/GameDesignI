extends Control


func _on_btn_calc_pressed():
	$ItemList.add_item("Number     Cube     Cuberoot Root")
	for num in range(-25, 26):
		var cube = pow(num, 3)
		var cuberoot = pow(num, pow(3, -1))
		var line = "%d     %d     %.4f"%[num, cube, cuberoot]
		$ItemList.add_item(line)


func _on_btn_clear_pressed():
	$ItemList.clear()


func _on_btn_exit_pressed():
	get_tree().quit()

