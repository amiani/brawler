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
    'combo': [
      {
        'input': { 'attack': { 'just_pressed': true } },
        'attack': 'cross'
      }
    ],
    'damage': 1
  },

  'cross': {
    'animation': 'cross',
    'combo': [
      {
        'input': {
          'attack': { 'just_pressed': true },
          'back': { 'pressed': true },
        },
        'attack': 'back_fist'
      },
      {
        'input': { 'attack': { 'just_pressed': true } },
        'attack': 'kick'
      },
    ],
    'damage': 2
  },

  'kick': {
    'animation': 'kick',
    'combo': {},
    'damage': 3
  },

  'back_fist': {
    'animation': 'backfist',
    'combo': {},
    'damage': 2
  }
}

const ACTIONS = ['right', 'left', 'up', 'down', 'jump', 'attack']
var actionMasks = {}

func _ready() -> void:
  var mask = 1
  for a in ACTIONS + ['forward', 'back']:
    actionMasks[a] = {}
    actionMasks[a].pressed = mask
    mask <<= 1
    actionMasks[a].just_pressed = mask
    mask <<= 1
    actionMasks[a].just_released = mask
    mask <<= 1

  initCombos(attacks, actionMasks)
  state = PlayerIdleState.new()
  actor.connect('ready', self, 'handleActorReady')

func handleActorReady():
  state.enter(self)

var inputs = []
const INPUTBUFFERLENGTH = 9
func getInput():
  var input = {}
  var mask = 0
  for a in ACTIONS:
    input[a] = {}
    input[a].just_pressed = Input.is_action_just_pressed(a)
    input[a].just_released = Input.is_action_just_released(a)
    input[a].pressed = Input.is_action_pressed(a)
  if actor.focus.scale.x == 1:
    input.forward = input.right
    input.back = input.left
  else:
    input.forward = input.left
    input.back = input.right
  for a in input.keys():
    if input[a].just_pressed:
      mask |= actionMasks[a].just_pressed
    if input[a].just_released:
      mask |= actionMasks[a].just_released
    if input[a].pressed:
      mask |= actionMasks[a].pressed
  input.mask = mask
  inputs.push_front(input)
  while inputs.size() > INPUTBUFFERLENGTH:
    inputs.pop_back()

func _physics_process(delta):
  getInput()
  updateState(delta)

func initCombos(attacks:Dictionary, actionMasks:Dictionary):
  for m in attacks.values():
    for c in m.combo:
      c.inputMask = 0b000000000000000000000000
      c.relevanceMask = 0b000000000000000000000000
      for action in c.input.keys():
        for stroke in c.input[action].keys():
          var actionMask = actionMasks[action][stroke]
          c.relevanceMask |= actionMask
          if c.input[action][stroke]:
            c.inputMask |= actionMask
