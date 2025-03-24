extends AnimationPlayer

func next():
	get_tree().change_scene_to_file("res://domecek/game.tscn")

func _init() -> void:
	self.play("intro")
