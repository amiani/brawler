extends KinematicBody2D
class_name Actor

var halfScreenSize : Vector2
export var walkSpeed = 300
var roomPosition : Vector3
var velocity = Vector3()
export var gravity = -100
var direction : Vector2
export var hitPlaneTolerance = 30
onready var sprite = find_node('AnimatedSprite')
onready var animation = find_node('AnimationPlayer')
onready var hurtbox = find_node('HurtBox')

func _ready():
  add_to_group('actors')
  sprite = find_node('AnimatedSprite', false, false)
  halfScreenSize = get_viewport_rect().size / 2
  roomPosition = Vector3(position.x, position.y, 0)

func _physics_process(delta):
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
  z_index = roomPosition.y
