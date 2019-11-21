extends StateController
class_name EnemyController

var states = {
  'idle': EnemyIdleState,
  'walk': EnemyWalkState,
  'jab': EnemyJabState,
  'hurt': EnemyHurtState,
  'fallingdown': EnemyFallingDownState,
  'die': EnemyDieState,
}

const interest = []
const danger = []

func _ready():
  state = EnemyIdleState.new()

func _physics_process(delta):
  updateState(delta)