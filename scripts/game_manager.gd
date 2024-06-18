extends Node

var dragging = false
@onready var control = $Control
@export var card_scene: PackedScene
func _ready():
	print_tree_pretty()

func _on_timer_timeout():
	var card = card_scene.instantiate()
	
	card._initialize(control.get_node("mainArea").position)
	
	control.get_node("mainArea").add_child(card)
