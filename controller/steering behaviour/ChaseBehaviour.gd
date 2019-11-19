extends SteeringBehaviour
class_name ChaseBehaviour

func getInterest(actor:Actor, resolution:int)->Array:
  var interest = initSteeringMap(resolution)
  var players = actor.get_tree().get_nodes_in_group('players')
  for p in players:
    var angle = actor.get_angle_to(p.position)
    var interestDirection = floor(resolution * angle / (2*PI))
    interest[interestDirection] = 1
  return interest

func getDanger(actor:Actor, resolution:int):
  var danger = initSteeringMap(resolution)
  return danger
