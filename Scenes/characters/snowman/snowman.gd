extends NonPlayableCharacter

@onready var hitbox_area: Area2D = $HitboxArea
@export var invunerable_cooldown:float=1.0
var cooldown_timer: Timer
var damage_cooldown_timer:SceneTreeTimer
var is_damagable:bool=true

func _ready() -> void:
	
	cooldown_timer = Timer.new()
	cooldown_timer.one_shot = true
	add_child(cooldown_timer)
	hitbox_area.area_entered.connect(on_hitbox_area_entered)

func start_cooldown():
	cooldown_timer.start(MergeManager.merge_cooldown) 
	# play particle/sprite effect here

func is_on_cooldown() -> bool:
	return cooldown_timer.time_left > 0


func on_hitbox_area_entered(area:Node2D):
	print(self,"hit by",area.name)
	if area.get_parent().is_in_group("enemy") and area is AttackArea and is_damagable==true:
		take_damage(area.damage)
		is_damagable=false
		await get_tree().create_timer(invunerable_cooldown).timeout
		is_damagable=true


func take_damage(damage:int):
	currentHealth= clampi(currentHealth-damage,0,maxHealth)
	print(self," took ",damage," damage. Health: ",currentHealth,"/",maxHealth)
