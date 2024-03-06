extends Node2D


func _ready():
	$Panel/slidGrav.value = $phys_ball.gravity_scale


func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var nball = preload("res://phys_ball.tscn").instantiate()
		nball.position=event.position
		var v_inertia = float($Panel/txtInrtia.text)
		var v_x = float($Panel/txtVX.text)
		var v_y = float($Panel/txtVY.text)
		var velocity = Vector2(v_x, v_y)
		nball.inertia=v_inertia
		nball.linear_velocity=velocity
		add_child(nball)


func _on_slid_grav_value_changed(value):
	for child in get_children():
		if child is RigidBody2D:
			child.gravity_scale=value


func _on_button_pressed():
	for child in get_children():
		if child is RigidBody2D:
			var force = randi_range(-1000, 1000)
			child.apply_central_impulse(Vector2(force,randi_range(-1000, 1000)))


func _on_button_2_pressed():
	var v_inertia = float($Panel/txtInrtia.text)
	var v_x = float($Panel/txtVX.text)
	var v_y = float($Panel/txtVY.text)
	var velocity = Vector2(v_x, v_y)
	for child in get_children():
		if child is RigidBody2D:
			child.inertia= v_inertia
			child.linear_velocity=velocity
			
			

