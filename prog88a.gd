extends Control


func _on_btn_calc_pressed():
	var num1 = int($lne1.text)
	var num2 = int($lne2.text)
	var sum = num1+num2
	var dif = num1-num2
	var pro = num1*num2
	var ave = float(sum)/2
	var abs = abs(dif)
	var max = 0
	var min = 0
	if num1 >num2:
		max = num1
		min = num2
	else:
		max = num2
		min = num1
	
	$lblOutput.text = "Sum = %s
	Difference = %s
	Product = %s
	Average = %.3f
	Absolute value = %s
	Maximum = %s
	Minimum = %s" % [sum, dif, pro, ave, abs, max, min]


func _on_btn_clear_pressed():
	$lblOutput.text = "Sum = 
Difference =	
Product =	
Average =	 
Absolute value =	
Maximum =	
Minimum = "
	$lne1.text = ""
	$lne2.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
