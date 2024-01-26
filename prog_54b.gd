extends Control


func _on_btn_calc_pressed():
	var num1 = int($lne1.text)
	var num2 = int($lne2.text)
	var num3 = int($lne3.text)
	var num4 = int($lne4.text)
	var sum = num1+num2+num3+num4
	var ave = float(sum)/4
	$lblSum.text = "Sum: "+str(sum)
	$lblAve.text = "Average: "+str(ave)


func _on_btn_clear_pressed():
	$lblSum.text = "Sum: "
	$lblAve.text = "Average: " 
	$lne1.text = ""
	$lne2.text = ""
	$lne3.text = ""
	$lne4.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
