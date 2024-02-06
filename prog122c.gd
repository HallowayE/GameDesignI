extends Control


func _on_btn_calc_pressed():
	$ItemList.add_item("Number     +1     *2     ^2")
	
	for num in range(2, 11, 2):
		var plus = num+1
		var times = num*2
		var sqr = pow(num, 2)
		var line = "%d     %d     %d     %d"%[num, plus, times, sqr]
		$ItemList.add_item(line)


func _on_btn_clear_pressed():
	$ItemList.clear()


func _on_btn_exit_pressed():
	get_tree().quit()
