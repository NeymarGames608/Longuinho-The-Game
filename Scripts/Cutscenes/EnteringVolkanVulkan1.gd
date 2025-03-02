extends Node2D


onready var anim = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("Scene")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Levels/VolkanVulkan1.tscn")
