extends Node2D
@onready var game_manager = $".."

var t = 4
@onready var card = $"."

func _initialize(position:):
	card.position = position

func _physics_process(delta):
	if game_manager.dragging:
		card.position = card.position.lerp(get_global_mouse_position(),delta * t)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if(get_global_mouse_position() - card.position).length() < 32:
			if not game_manager.dragging and event.pressed :
				game_manager.dragging = true
		if game_manager.dragging and not event.pressed :
			game_manager.dragging = false
		
