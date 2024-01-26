extends Control


func _on_btn_calc_pressed():
	var rad = float($lneRad.text)
	var area = PI*pow(rad, 2)
	var circ = 2*PI*rad
	$lblArea.text = "Area: "+str(snapped(area, 0.001))
	$lblCirc.text = "Circumferance: "+str(snapped(circ, 0.001))


func _on_btn_clear_pressed():
	$lblArea.text = "Area: "
	$lblCirc.text = "Circumferance: " 
	$lneRad.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
