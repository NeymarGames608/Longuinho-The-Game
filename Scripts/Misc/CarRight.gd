extends KinematicBody2D

# Referências aos nós
onready var anim_sprite = $AnimatedSprite
onready var area_trigger = $Area2D
onready var collision_shape = $CollisionShape2D

# Variáveis de controle
var movendo = false
var velocidade = 500  # Velocidade de movimento
var direcao = Vector2(1, 0)  # Direção inicial (para a esquerda)
var flip_h = true  # Para definir o Flip H do AnimatedSprite

func _ready():
	# Configurar a animação inicial para parado
	anim_sprite.play("Idle")
	anim_sprite.flip_h = flip_h  # Definir o Flip H conforme a direção

	# Detectar o contato com o player
	area_trigger.connect("body_entered", self, "_on_body_entered")
	area_trigger.connect("body_exited", self, "_on_body_exited")

func _process(delta):
	# Se o carro estiver se movendo, move na direção correta
	if movendo:
		move_and_slide(direcao * velocidade)  # Mover na direção
		anim_sprite.play("Move")  # Animação de movimento
	elif not movendo:
		anim_sprite.play("Idle")  # Se não estiver se movendo, animação de parado

func _on_body_entered(body):
	# Verificar se o corpo que tocou é o player
	if body.is_in_group("Player"):
		movendo = true

func _on_body_exited(body):
	# Verificar se o player saiu do carro
	if body.is_in_group("Player"):
		movendo = false
