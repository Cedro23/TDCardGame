extends Node2D

@onready var card_scene: PackedScene = preload("res://scenes/hud/card.tscn")

@onready var spawn_point: Node2D = $CanvasLayer/Spawn
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var card: Card = card_scene.instantiate()
	spawn_point.add_child(card)
	card.set_card_values(3, "cool", "cool")
	card.visible = true


func _on_button_2_pressed():
	var card: Card = card_scene.instantiate()
	spawn_point.add_child(card)
	card.set_card_values(6, "bad", "bad")
	card.visible = true # Replace with function body.
