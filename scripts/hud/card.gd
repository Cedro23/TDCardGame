class_name Card extends Node2D

@export var card_name: String = "Card Name"
@export var card_description: String = "Card Description"
@export var card_cost: int = 1
@export var card_image: Sprite2D

@onready var cost_lbl: Label = $TopCard/CostGroup/WaterCost/WaterLabel
@onready var name_lbl: Label = $TopCard/Name/NameLabel
@onready var description_lbl: Label = $BottomCard/Description/Label

func _ready():
	set_card_values(card_cost,card_name,card_description)
	visible = false

func set_card_values(_cost: int, _name: String, _description: String):
	card_cost = _cost
	card_name = _name
	card_description = _description
	
	cost_lbl.set_text(str(_cost))
	name_lbl.set_text(_name)
	description_lbl.set_text(_description)



func _process(delta):
	pass
