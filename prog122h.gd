extends Control


func _on_btn_calc_pressed():
	$ItemList.add_item("Number     Square     Square Root     Cube     Fourth Root")
	
	for num in range(1, 21):
		var sqr = pow(num, 2)
		var sqrt = pow(num,0.5)
		var cube = pow(num, 4)
		var tes = pow(num, 0.25)
		var line = "%d     %d     %.3f     %d     %.3f"%[num, sqr, sqrt, cube, tes]
		$ItemList.add_item(line)


func _on_btn_clear_pressed():
	$ItemList.clear()


func _on_btn_exit_pressed():
	get_tree().quit()

