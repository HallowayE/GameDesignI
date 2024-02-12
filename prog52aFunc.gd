extends Control


func sayHi():
	print("Hi!")


func getArea(len, wid):
	var area = len*wid
	return area

func getPerim(len, wid):
	return (len+wid)*2


func _on_btn_calc_pressed():
	sayHi()
	var len = int($lneLength.text)
	var wid = int($lneWidth.text)
	var area = getArea(len, wid)
	var perim = getPerim(len, wid)
	$Label.text="Area: %s

Perimeter: %s"%[area, perim]


func _on_btn_clear_pressed():
	$lneLength.text=""
	$lneWidth.text=""
	$Label.text="Area:

Perimeter: "


func _on_btn_exit_pressed():
	get_tree().quit()
