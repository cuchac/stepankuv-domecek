extends Node2D

var scale_state: AnimationNodeStateMachinePlayback
var hand_state: AnimationNodeStateMachinePlayback

func _ready() -> void:
	scale_state = $Scale/AnimationTree.get("parameters/playback")	
	hand_state = $Ruka/AnimationTree.get("parameters/playback")

func _input(_ev):
	if Input.is_action_just_pressed("catch"):
		scale_state.travel("scale", false)
	if Input.is_action_just_released("catch"):
		var sila = abs($Scale/Pin.position.y)
		var animation: Animation = $Ruka/AnimationTree.get_animation("ruka_chytne")
		print(animation)
		print(animation.track_get_key_count(0))
		print(animation.track_get_key_time(0, 1))
		print(animation.track_get_key_value(0, 1))
		animation.track_set_key_value(0, 1, 400 - sila)
		scale_state.travel("RESET", false)
		hand_state.travel("ruka_chytne", false)
