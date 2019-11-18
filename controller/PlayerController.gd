extends StateController
class_name PlayerController

var states = {
  'walk': PlayerWalkState,
  'idle': PlayerIdleState,
  'jump': PlayerJumpState,
  'jab': PlayerJabState,
  'ground': PlayerGroundState,
}

func _ready() -> void:
  ._ready()
  state = PlayerIdleState.new()
  actor.connect('ready', self, 'handleActorReady')

func handleActorReady():
  state.enter(self)

const inputs = []
const INPUTBUFFERLENGTH = 10
const ACTIONS = ['right', 'left', 'up', 'down', 'jump', 'attack']
func getInput():
  var input = {}
  for a in ACTIONS:
    input[a] = {}
    input[a].just_pressed = Input.is_action_just_pressed(a)
    input[a].just_released = Input.is_action_just_released(a)
    input[a].pressed = Input.is_action_pressed(a)
  inputs.push_front(input)
  while inputs.size() > INPUTBUFFERLENGTH:
    inputs.pop_back()

func _physics_process(delta):
  getInput()
  updateState(delta)
