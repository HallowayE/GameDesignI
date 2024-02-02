extends Control


func _on_btn_calc_pressed():
	var weight = int($lneWeight.text)
	var length = int($lneLength.text)
	var width = int($lneWidth.text)
	var height = int($lneHeight.text)
	var volume = length*width*height
	if weight > 27 and volume > 100000:
		$Label.text = "Too heavy and too large"
	elif weight > 27:
		$Label.text = "Too heavy"
	elif volume > 100000:
		$Label.text = "Too large"
	else:
		$Label.text = "All good"


func _on_btn_clear_pressed():
	$Label.text = ""
	$lneWeight.text = ""
	$lneLength.text = ""
	$lneWidth.text = ""
	$lneHeight.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
