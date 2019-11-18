extends SteeringBehaviour
class_name ChaseBehaviour

func getInterest(actor:Actor, resolution:int)->Array:
  var interest = initSteeringMap(resolution)
  var players = actor.get_tree().get_nodes_in_group('players')
  #breakpoint
  for p in players:
    var angle = actor.get_angle_to(p.global_position)
    var interestDirection = floor(resolution * angle / (2*PI))
    interest[interestDirection] = .5
  return interest

func getDanger(actor:Actor, resolution:int):
  var danger = initSteeringMap(resolution)
  return danger
