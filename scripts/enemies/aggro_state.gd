extends State
class_name AggroState

#? Is it supposed to be here ?
func process(_delta):
	pass

func _on_attack_range_body_entered(body: Node2D):
	if body == enemy._target:
		transitioned.emit("attack")
