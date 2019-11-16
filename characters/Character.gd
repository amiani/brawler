extends KinematicBody2D
class_name Character

var states = {
  'walk': WalkState,
  'idle': IdleState,
  'jump': JumpState
}

var halfScreenSize : Vector2
var state : CharacterState
export var walkSpeed = 300
var roomPosition : Vector3
var velocity = Vector3()
export var gravity = -100
export var friction = 10
export var airResistance = 1
var direction : Vector2
var sprite : AnimatedSprite
var animation : AnimationPlayer

func _ready():
  halfScreenSize = get_viewport_rect().size / 2
  roomPosition = Vector3(position.x, position.y, 0)
  sprite = get_child(0)
  animation = get_child(1)
  state = IdleState.new()
  state.enter(self)

func _physics_process(delta):
  var nextState = state.update(self, delta, inputs)
  if nextState != null:
    state = nextState
    state.enter(self)

  integrate(delta)

  if sprite.flip_h && velocity.x > 0:
    sprite.flip_h = false
  elif !sprite.flip_h && velocity.x < 0:
    sprite.flip_h = true

func integrate(delta):
  roomPosition.x = position.x
  roomPosition.y = position.y + roomPosition.z
  if roomPosition.z > 0:
    velocity.z += gravity
  else:
    velocity.z = 0
    roomPosition.z = 0
  roomPosition += velocity * delta
  roomPosition.x = clamp(roomPosition.x, -halfScreenSize.x, halfScreenSize.x)
  roomPosition.y = clamp(roomPosition.y, 180, halfScreenSize.y)
  roomPosition.z = clamp(roomPosition.z, 0, 100)
  var clampedVelocity = Vector2(
    (roomPosition.x - position.x) / delta,
    (roomPosition.y - position.y - roomPosition.z) / delta)
  move_and_slide(clampedVelocity)

var inputs = []
const actions = ['RIGHT', 'LEFT', 'UP', 'DOWN', 'JUMP']
func _input(event):
  for a in actions:
    if event.is_action_pressed(a):
      inputs.push_back(a+'_PRESSED')
    elif event.is_action_released(a):
      inputs.push_back(a+'_RELEASED')