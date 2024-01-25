extends Control


func _on_btn_calc_pressed():
	var len = int($lneLength.text)
	var wid = int($lneWidth.text)
	var area = len*wid
	var perim = len+len+wid+wid
	$lblArea.text = "Area: "+str(area)
	$lblPerim.text = "Perimeter: "+str(perim)


func _on_btn_clear_pressed():
	$lblArea.text = "Area: "
	$lblPerim.text = "Perimeter" 
	$lneLength.text = ""
	$lneWidth.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
