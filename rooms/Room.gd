extends Node2D
class_name Room

func handleSpawn(mob:Actor, globalPosition:Vector2):
  mob.position = to_local(globalPosition) + Vector2(randi()%20, randi()%20)
  add_child(mob)