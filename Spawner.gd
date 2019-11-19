extends Node2D
class_name Spawner

export(PackedScene) var mobScene
signal spawn
var time = 0
export var spawnTimer = 5
export var groupSize = 2
func _process(delta):
  time += delta
  if time >= spawnTimer:
    var totalMobs = get_tree().get_nodes_in_group('enemies').size()
    if totalMobs <= 8:
      for i in range(0, groupSize):
        emit_signal('spawn', mobScene.instance(), global_position)
        time = 0