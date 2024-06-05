extends State
class_name AlertState

func enter():
	pass

func process(_delta: float):
	if enemy.target != null:
		transitioned.emit("aggro")