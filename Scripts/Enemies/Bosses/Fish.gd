extends KinematicBody2D

# Variáveis para o mini boss
var vidas = 10
var velocidade = 150  # Aumento da velocidade
var caminho = 0  # Controla o estado do movimento
var destino = Vector2(0, 0)

# Referências dos nós
onready var sprite = $Sprite
onready var area = $Area2D
onready var collision_shape = $CollisionShape2D
onready var label = $CanvasLayer/Label  # Certifique-se de que o Label está presente na cena

func _ready():
	# Posição inicial e flip H
	position = Vector2(0, 0)
	sprite.flip_h = false
	destino = Vector2(-512, 300)
	
	# Desativa a CollisionShape2D
	collision_shape.disabled = true
	
	# Atualiza o label para mostrar a vida inicial
	label.text = "Health: %d" % vidas

func _process(delta):
	# Movimento
	var direcao = (destino - position).normalized()
	move_and_slide(direcao * velocidade)

	# Verifica se o mini boss chegou ao destino
	if position.distance_to(destino) < 10:
		_trocar_destino()

func _on_Area2D_body_entered(body):
	# Quando qualquer coisa encosta na área do mini boss, ele perde uma vida
	vidas -= 1
	print("Vidas restantes: %d" % vidas)

	# Atualiza o label com a quantidade de vida restante
	label.text = "Health: %d" % vidas

	# Verifica se o mini boss morreu
	if vidas <= 0:
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
		return

func _trocar_destino():
	# Muda o destino baseado no movimento do mini boss
	if caminho == 0:
		destino = Vector2(-512, 300)
		sprite.flip_h = false
		caminho = 1
	elif caminho == 1:
		destino = Vector2(0, 0)
		sprite.flip_h = true
		caminho = 2
	elif caminho == 2:
		destino = Vector2(512, 300)
		sprite.flip_h = true
		caminho = 3
	elif caminho == 3:
		destino = Vector2(0, 0)
		sprite.flip_h = false
		caminho = 0

