extends Control
@onready var game_manager = $".."

@onready var h_box_container = %handArea

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_h_box_container_gui_input(event):
	if event is InputEventMouse && game_manager.dragging:
		if not event.pressed:
			print("released")
			
			
