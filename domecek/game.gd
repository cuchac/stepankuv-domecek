extends Node


const PLAYER_WIN = "res://dialogue/dialogue_data/player_won.json"
const PLAYER_LOSE = "res://dialogue/dialogue_data/player_lose.json"

@export var exploration_screen: Node

var hrac
var kamera

func _ready():
	for n in $Exploration/Home.get_children():
		if not n.name == "Player":
			continue
		if not n.has_node("DialoguePlayer"):
			continue
		n.get_node("DialoguePlayer").dialogue_finished.connect(_on_opponent_dialogue_finished.bind(n))

	hrac = $Exploration/Home/Player
	kamera = $kamera

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	kamera.position = hrac.global_position

func _on_opponent_dialogue_finished(opponent):
	if opponent.lost:
		return
	var player = $Exploration/Grid/Player
	var combatants = [player.combat_actor, opponent.combat_actor]


func _on_combat_finished(winner, _loser):
	$AnimationPlayer.play_backwards("fade")
	add_child(exploration_screen)
	var dialogue = load("res://dialogue/dialogue_player/dialogue_player.tscn").instantiate()

	if winner.name == "Player":
		dialogue.dialogue_file = PLAYER_WIN
	else:
		dialogue.dialogue_file = PLAYER_LOSE

	await $AnimationPlayer.animation_finished
	var player = $Exploration/Grid/Player
	exploration_screen.get_node("DialogueUI").show_dialogue(player, dialogue)
	await dialogue.dialogue_finished
	dialogue.queue_free()


func _on_texture_button_pressed() -> void:
	get_tree().quit()
