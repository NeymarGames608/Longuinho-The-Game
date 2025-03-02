extends KinematicBody2D

# Variáveis
var speed = 200
var run_speed = 400
var jump_speed = -600  # Ajuste de velocidade do pulo
var gravity = 1200     # Gravidade que afeta o personagem
var velocity = Vector2()  # Vetor de velocidade
var can_double_jump = true  # Flag para verificar se o pulo duplo pode ser usado

# Referências
onready var sprite = $AnimatedSprite

# Função para verificar se a queda foi muito alta e recarregar a fase
func check_fall():
	if position.y > 1200:  # Se cair abaixo de Y = 1200
		match CurrentLevel.current_level:
			0:
				get_tree().change_scene("res://Scenes/MainMenu.tscn")
			1:
				get_tree().change_scene("res://Scenes/Levels/GardenStar.tscn")
			1.5:
				get_tree().change_scene("res://Scenes/Levels/Bosses/BossBee.tscn")
			# Adicione mais casos conforme for aumentando o número de fases
			2:
				get_tree().change_scene("res://Scenes/Levels/DyarnBeach.tscn")
			2.5:
				get_tree().change_scene("res://Scenes/Levels/Bosses/BossFish.tscn")
			3:
				get_tree().change_scene("res://Scenes/Levels/CrystalCavern.tscn")
			3.5:
				get_tree().change_scene("res://Scenes/Levels/Bosses/BossCrystalGolem.tscn")
			4:
				get_tree().change_scene("res://Scenes/Levels/VolkanVulkan1.tscn")
			4.5:
				get_tree().change_scene("res://Scenes/Levels/Bosses/VolkanVulkan1Boss.tscn")
			_:
				get_tree().change_scene("res://Scenes/MainMenu.tscn")  # Padrão se não achar um caso correspondente

# Função de pronto
func _ready():
	sprite.play("Idle")

func _physics_process(delta):
	var direction = 0

	# Movimento para a esquerda ou direita
	if Input.is_action_pressed("ui_left"):
		direction = -1
		sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		direction = 1
		sprite.flip_h = false

	# Aplica a velocidade de movimento (com ou sem corrida)
	if Input.is_action_pressed("ui_shift"):
		velocity.x = direction * run_speed
	else:
		velocity.x = direction * speed

	# Pular e Pulo Duplo
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():  # Primeiro pulo
			velocity.y = jump_speed
			can_double_jump = true
			sprite.play("Jump")
		elif can_double_jump:  # Pulo duplo
			velocity.y = jump_speed
			can_double_jump = false
			sprite.play("Jump")

	# Gravidade
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		can_double_jump = true  # Reseta o pulo duplo quando tocar o chão

	# Aplica o movimento
	velocity = move_and_slide(velocity, Vector2(0, -1))

	# Animações
	if is_on_floor():
		if velocity.x != 0:
			if Input.is_action_pressed("ui_shift"):
				sprite.play("Run")
			else:
				sprite.play("Walk")
		else:
			sprite.play("Idle")
	else:
		if velocity.y > 0:
			sprite.play("Fall")

	# Verifica se o personagem caiu muito alto e recarrega a fase
	check_fall()
