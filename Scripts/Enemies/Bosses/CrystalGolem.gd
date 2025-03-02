extends KinematicBody2D

# Variáveis do boss
var speed = 50
var attack_timer = 0
var attack_interval = 2.0 # Tempo entre ataques
var direction = 1
var health = 15

# Nós do boss
onready var head = $Head
onready var fist_left = $FistLeft
onready var fist_right = $FistRight
onready var health_label = $CanvasLayer/Health
onready var area = $Area2D

func _ready():
	update_health_label()

func _physics_process(delta):
	# Movimento básico de vai e vem
	position.x += speed * direction * delta
	if position.x > 300:
		direction = -1
	elif position.x < 100:
		direction = 1
	
	# Contagem regressiva para ataque
	attack_timer -= delta
	if attack_timer <= 0:
		attack()
		attack_timer = attack_interval

func attack():
	# Alterna entre ataques com os punhos
	if randi() % 2 == 0:
		attack_fist(fist_left)
	else:
		attack_fist(fist_right)

func attack_fist(fist):
	var tween = create_tween()
	var start_pos = fist.position
	var end_pos = start_pos + Vector2(0, 50) # Movimento do soco
	
	# Animação de soco
	tween.tween_property(fist, "position", end_pos, 0.2)
	tween.tween_property(fist, "position", start_pos, 0.2).set_delay(0.3)
	
	print("Soco do Golem!")

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		health -= 1
		update_health_label()
		if health <= 0:
			get_tree().change_scene("res://Cutscenes/EnteringVolkanVulkan1.tscn")

func update_health_label():
	health_label.text = "Health: " + str(health)
