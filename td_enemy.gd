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
