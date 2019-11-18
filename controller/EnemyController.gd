extends Controller
class_name EnemyController

func _ready():
  ._ready()
  state = EnemyIdleState.new()

func _physics_process(delta):
  updateState(delta)