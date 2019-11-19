extends ActorState
class_name EnemyWalkState

var resolution = 16
var behaviours = [ChaseBehaviour.new()]

func enter(controller):
  controller.actor.animation.play('walk')

func exit(controller):
  controller.actor.animation.stop()

func update(controller, delta)->ActorState:
  if hit:
    return controller.states.hit.new()
  var actor = controller.actor
  steer(actor)
  var players = actor.get_tree().get_nodes_in_group('players')
  for p in players:
    var distance = p.global_position - actor.global_position
    if abs(distance.y) <= actor.hitPlaneTolerance && abs(distance.x) < 110 && abs(distance.x) > 80:
      return controller.states.idle.new()
  return null

func steer(actor):
  var interest = []
  var danger = []
  for i in range(0, resolution):
    interest.push_back(0)
    danger.push_back(0)

  for b in behaviours:
    var behaviourInterest = b.getInterest(actor, resolution)
    var behaviourDanger = b.getDanger(actor, resolution)
    for i in range(0, resolution):
      interest[i] = max(interest[i], behaviourInterest[i])
      danger[i] = max(danger[i], behaviourDanger[i])

  interest = maskInterest(interest, danger)

  var direction = 0
  var magnitude = 0
  for i in range(0, resolution):
    if interest[i] > magnitude:
      direction = i
      magnitude = interest[i]

  var angle = 2*PI * direction/resolution
  actor.velocity.x = cos(angle) * actor.walkSpeed * magnitude
  actor.velocity.y = sin(angle) * actor.walkSpeed * magnitude

func maskInterest(interest:Array, danger:Array)->Array:
  for i in range(0, interest.size()):
    if danger[i] > 0:
      interest[i] = 0
  return interest
