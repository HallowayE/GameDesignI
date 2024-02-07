extends Control


func _on_btn_calc_pressed():
	var mySum = 0
	var lcv = 3
	while (lcv <= 9669):
		mySum+=lcv
		$ItemList.add_item(str(mySum-lcv)+" + "+str(lcv)+" = "+str(mySum))
		lcv+=3


func _on_btn_clear_pressed():
	$ItemList.clear()


func _on_btn_exit_pressed():
	get_tree().quit()
