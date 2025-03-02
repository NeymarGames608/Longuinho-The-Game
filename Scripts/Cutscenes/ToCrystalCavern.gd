extends Node2D


onready var animation = $Fish/AnimationPlayer
onready var holeanim = $Hole/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("Move")
	holeanim.play("Move")


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Levels/CrystalCavern.tscn")
