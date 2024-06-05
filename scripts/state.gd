extends Node
class_name State

signal transitioned(new_state_name: StringName)

@export var can_move: bool = true
var next_state: State

var enemy: Enemy

func handle_input(_event: InputEvent):
	pass

func enter():
	pass

func exit():
	pass

func process_physics(_delta: float):
	pass

func process(_delta: float):
	pass