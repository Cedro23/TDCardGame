extends RigidBody2D

var dragging = false
var t = 4
@onready var card = $".."

func _physics_process(delta):
	if dragging:
		
		card.position = card.position.lerp(get_global_mouse_position(),delta * t)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		print(card.global_position)
		print(get_global_mouse_position())
		if(get_global_mouse_position() - card.position).length() < 32:
			if not dragging and event.pressed :
				dragging = true
		if dragging and not event.pressed :
			dragging = false
		
