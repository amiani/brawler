extends ActorState
class_name EnemyWalkState

var resolution = 16
var behaviours = [ChaseBehaviour.new()]

func enter(controller):
  controller.actor.animation.play('walk')

func exit(controller):
  controller.actor.animation.stop()

func update(controller, delta)->ActorState:
  var interest = []
  var danger = []
  for i in range(0, resolution):
    interest.push_back(0)
    danger.push_back(0)

  for b in behaviours:
    var behaviourInterest = b.getInterest(controller.actor, resolution)
    var behaviourDanger = b.getDanger(controller.actor, resolution)
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
  controller.actor.velocity.x = cos(angle) * controller.actor.walkSpeed
  controller.actor.velocity.y = sin(angle) * controller.actor.walkSpeed
  return null

func maskInterest(interest:Array, danger:Array)->Array:
  for i in range(0, interest.size()):
    if danger[i] > 0:
      interest[i] = 0
  return interest
