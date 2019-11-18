extends Node
class_name SteeringBehaviour

func initSteeringMap(resolution:int, value=0)->Array:
  var map = []
  for i in range(0, resolution):
    map.push_back(value)
  return map

func getInterest(actor:Actor, resolution:int) -> Array:
  return initSteeringMap(resolution)

func getDanger(actor:Actor, resolution:int) -> Array:
  var danger = []
  for i in range(resolution):
    danger.push_back(0)
  return danger
