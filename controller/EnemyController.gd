extends StateController
class_name EnemyController

const states = {
  'idle': EnemyIdleState,
  'walk': EnemyWalkState,
  'jab': EnemyJabState,
}

const interest = []
const danger = []

func _ready():
  ._ready()
  state = EnemyIdleState.new()

func _physics_process(delta):
  updateState(delta)