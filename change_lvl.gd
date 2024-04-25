extends Area2D

@export var next_level = ""
@export var coord = Vector2()

func _on_body_entered(body):
	if body.is_in_group("Player"):
		var lvl = "res://"+next_level+".tscn"
		get_tree().change_scene_to_file(lvl)
		body.global_position+=coord
