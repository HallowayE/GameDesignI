extends CharacterBody2D

const SPEED = 60
var MAX_HEALTH = 30
var HEALTH = MAX_HEALTH
var DAMAGE = 10
var AI_STATE = STATES.IDLE

enum STATES { IDLE=0, UP, DOWN, LEFT, RIGHT, 
			  UP_L, UP_R, DOWN_L, DOWN_R, DAMAGED}
var state_directions = [
	Vector2.ZERO,
	Vector2.UP,
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.RIGHT,
	Vector2(-1,-1).normalized(), #UP_LEFT
	Vector2(1,-1).normalized(), #UP_RIGHT
	Vector2(-1,1).normalized(), #DOWN_LEFT
	Vector2(1,1).normalized(), #DOWN_RIGHT
	Vector2.ZERO
]

var state_anims = [
	"",
	"e_walk_up",
	"e_walk_down",
	"e_walk_left",
	"e_walk_right",
	"e_walk_left",
	"e_walk_right",
	"e_walk_left",
	"e_walk_right",
	""
]

var inertia = Vector2()
var ai_timer_max = 0.5
var ai_timer = ai_timer_max - randi() % 5
var dam_lock = 0
var anim_lock = 0
var knockback = 128
var vision_distance = 50
var money_value = 5

signal recovered

@onready var raycastR = $rcr
@onready var raycastM = $rcm
@onready var raycastL = $rcl

@onready var anim_player = $AnimatedSprite2D

func turn_toward_player_location(location: Vector2):
	var dir_to_player = (location - self.global_position).normalized()
	velocity = dir_to_player*(SPEED*2)
	var closest_angle = INF
	var closest_state = STATES.IDLE
	for i in range(1, 5):
		var state_dir = state_directions[i]
		var angle_dif = abs(state_dir.angle_to(dir_to_player))
		if angle_dif < closest_angle:
			closest_angle=angle_dif
			closest_state=STATES.values()[i]
	AI_STATE=closest_state


func take_damage(dmg, attacker=null):
	if dam_lock==0:
		AI_STATE=STATES.DAMAGED
		HEALTH -= dmg
		dam_lock=0.2
		anim_lock=0.2
		#TODO: Damage Shader
		if HEALTH <= 0:
			#TODO: Drop Item
			#TODO: play Death Sound
			queue_free()
		else:
			if attacker!=null:
				var loc = attacker.global_position
				await recovered
				turn_toward_player_location(loc)

func _physics_process(delta):
	anim_lock=max(anim_lock-delta, 0)
	dam_lock=max(dam_lock-delta, 0)
	if int(AI_STATE)>=1 and int(AI_STATE)<=8:
		var raydir = state_directions[int(AI_STATE)]
		raycastM.target_position=raydir*vision_distance
		raycastL.target_position=raydir.rotated(deg_to_rad(-45)).normalized()*vision_distance
		raycastR.target_position=raydir.rotated(deg_to_rad(45)).normalized()*vision_distance
	if anim_lock==0:
		if AI_STATE==STATES.DAMAGED:
			#TODO: reset shader
			AI_STATE=STATES.IDLE
			recovered.emit()
		#TODO: damge player
		
		ai_timer = clamp(ai_timer-delta, 0, ai_timer_max)
		if ai_timer == 0:
			if AI_STATE == STATES.IDLE:
				var rnd_move = randi() % 4
				AI_STATE = STATES.values()[rnd_move+1]
			else:
				AI_STATE=STATES.IDLE
			ai_timer=ai_timer_max
		var direction = state_directions[int(AI_STATE)]
		velocity = direction * SPEED
		
		var anim = state_anims[int(AI_STATE)]
		if anim and not anim_player.is_playing():
			anim_player.play(anim)
		if AI_STATE==STATES.IDLE and anim_player.is_playing():
			anim_player.stop()
		
		velocity+=inertia
		move_and_slide()
		inertia = inertia.move_toward(Vector2(), delta * 1000)
