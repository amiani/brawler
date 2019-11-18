extends Reference
class_name Steerer

const behaviours = []
var resolution : int
func _init(behaviours:Array, resolution:int):
  self.behaviours = behaviours
  self.resolution = resolution