extends Node2D


@export var contents: Dictionary = {}
var OPEN_STATE = false
var regex = RegEx.new()


func in_range(player) -> bool:
	return player.data.state != player.STATES.DEAD and $StaticBody2D/Area2D.overlaps_body(player)
	

func interacts(player):
	if not OPEN_STATE:
		open_chest(player)


func open_chest(player):
	OPEN_STATE=true
	$Sprite2D.frame = 1
	for item in contents.keys():
		drop_item(item, contents[item], player)
		await get_tree().create_timer(0.5).timeout
	contents = {}


