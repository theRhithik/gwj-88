class_name NonPlayableCharacter
extends CharacterBody2D

@export var min_walk_cycle: int=1
@export var max_walk_cycle: int=4

@export var level: int=1
@export var speed:float=20
@export var maxHealth:int=1
@export var hitDamage:int=1
var currentHealth:int
var facing:float
var walk_cycles:int
var current_walk_cycle:int
@export var target:Node2D
@export var merge_distance: float = 32.0
