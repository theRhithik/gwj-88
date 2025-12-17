extends NonPlayableCharacter

var cooldown_timer: Timer

func _ready() -> void:
	add_to_group("enemy")
	cooldown_timer = Timer.new()
	cooldown_timer.one_shot = true
	add_child(cooldown_timer)

func start_cooldown():
	cooldown_timer.start(MergeManager.merge_cooldown) 
	# play particle/sprite effect here

func is_on_cooldown() -> bool:
	return cooldown_timer.time_left > 0
