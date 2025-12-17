extends Node


var character_scene: PackedScene = preload("res://scenes/characters/icicle_beast/icicle_beast.tscn")
var merge_cooldown: float = 0.5  # seconds

func _process(_delta):
	var chars = get_tree().get_nodes_in_group("enemy")

	for i in range(chars.size()):
		for j in range(i + 1, chars.size()):
			var a = chars[i]
			var b = chars[j]

			# Skip if either is cooling down
			if a.is_on_cooldown() or b.is_on_cooldown():
				continue

			if a.level == b.level and a.position.distance_to(b.position) <= a.merge_distance:
				merge(a, b)
				print("merge",a," ",b)

func merge(a, b):
	var merged = character_scene.instantiate()
	merged.level = a.level + 1
	merged.position = (a.position + b.position) / 2
	merged.target=a.target
	merged.maxHealth = a.maxHealth+1
	merged.speed = a.speed-2
	merged.hitDamage = a.hitDamage*2
	merged.scale = a.scale*2
	merged.merge_distance = a.merge_distance*2
	get_tree().current_scene.add_child(merged)

	# Put merged character into group and start cooldown
	merged.add_to_group("enemy")
	merged.start_cooldown()

	a.queue_free()
	b.queue_free()
