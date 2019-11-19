extends KinematicBody2D
class_name Actor

var halfScreenSize : Vector2
var roomPosition : Vector3
var velocity = Vector3()
var flipVector = Vector2()
export var walkSpeed = 300
export var gravity = -100
export var hitPlaneTolerance = 100
export var outsideScreenDistance = 0
export var health = 5
export var jabDamage = 1
onready var sprite = find_node('AnimatedSprite')
onready var animation = find_node('AnimationPlayer')
onready var hurtbox = sprite.find_node('HurtBox')
onready var hitbox = sprite.find_node('HitBox')

func _ready():
  halfScreenSize = get_viewport_rect().size / 2
  roomPosition = Vector3(position.x, position.y, 0)

func _physics_process(delta):
  integrate(delta)

  if sprite.flip_h && velocity.x > 0:
    sprite.flip_h = false
    flipVector = Vector2(1, 1)
  elif !sprite.flip_h && velocity.x < 0:
    sprite.flip_h = true
    flipVector = Vector2(-1, 1)

func integrate(delta):
  roomPosition.x = position.x
  roomPosition.y = position.y
  if roomPosition.z > 0:
    velocity.z += gravity
  else:
    velocity.z = 0
    roomPosition.z = 0
  roomPosition += velocity * delta
  roomPosition.x = clamp(roomPosition.x, -halfScreenSize.x - outsideScreenDistance, halfScreenSize.x + outsideScreenDistance)
  roomPosition.y = clamp(roomPosition.y, 180, halfScreenSize.y)
  roomPosition.z = clamp(roomPosition.z, 0, 100)
  var clampedVelocity = Vector2(
    (roomPosition.x - position.x) / delta,
    (roomPosition.y - position.y) / delta)
  sprite.position.y = -roomPosition.z
  move_and_slide(Vector2(velocity.x, velocity.y))
  z_index = roomPosition.y

func takeDamage(damage:int):
  health -= damage

func flip(flip_h:bool):
  sprite.flip_h = flip_h
  for c in sprite.get_children():
    c.position *= Vector2(-1, 0) if flip_h else Vector2(1, 0)
