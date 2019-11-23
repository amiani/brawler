extends Area2D
class_name HitBox

export var damage = 0
var actor

func _ready():
  get_child(0).disabled = true
