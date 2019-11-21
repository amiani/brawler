extends StateController
class_name PlayerController

var states = {
  'walk': PlayerWalkState,
  'idle': PlayerIdleState,
  'jump': PlayerJumpState,
  'attack': PlayerAttackState,
}

var attacks = {
  'jab': {
    'animation': 'jab',
    'combo': {
      'attack': 'cross'
    },
    'damage': 1
  },

  'cross': {
    'animation': 'cross',
    'combo': {
      'attack': 'kick'
    },
    'damage': 2
  },

  'kick': {
    'animation': 'kick',
    'combo': {},
    'damage': 3
  }
}

func _ready() -> void:
  state = PlayerIdleState.new()
  actor.connect('ready', self, 'handleActorReady')

func handleActorReady():
  state.enter(self)

var inputs = []
const INPUTBUFFERLENGTH = 9
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
