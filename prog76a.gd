extends Control


func _on_btn_calc_pressed():
	var digit = float($lneDigit.text)
	var txt = str(digit)+"\n* 9\n"+str(digit*9)+"\n* 12345679\n"+str(digit*9*12345679)
	$lblOutput.text = txt

func _on_btn_clear_pressed():
	$lblOutput.text = ""
	$lneDigit.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
