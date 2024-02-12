extends Control


func myAdd(num1, num2):
	return num1+num2
func mySub(num1, num2):
	return num1-num2
func myMul(num1, num2): 
	return num1*num2
func myDiv(num1, num2):
	return float(num1)/float(num2)
func myPow(num1, num2):
	return pow(num1, num2)
func myMod(num1, num2):
	return num1%num2


func _on_btn_plus_pressed():
	$Label.text= "Results: %d"%myAdd(int($lne1.text), int($lne2.text))


func _on_btn_minus_pressed():
	$Label.text= "Results: %d"%mySub(int($lne1.text), int($lne2.text))


func _on_btn_times_pressed():
	$Label.text= "Results: %d"%myMul(int($lne1.text), int($lne2.text))


func _on_btn_pow_pressed():
	$Label.text= "Results: %d"%myPow(int($lne1.text), int($lne2.text))


func _on_btn_div_pressed():
	$Label.text= "Results: %.2f"%myDiv(int($lne1.text), int($lne2.text))


func _on_btn_mod_pressed():
	$Label.text= "Results: %d"%myMod(int($lne1.text), int($lne2.text))


func _on_btn_clear_pressed():
	$lne1.text=""
	$lne2.text=""
	$Label.text= "Results: "


func _on_btn_exit_pressed():
	get_tree().quit()
