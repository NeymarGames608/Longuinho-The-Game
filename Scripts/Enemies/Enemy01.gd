extends KinematicBody2D

# Variáveis
var speed = 100  # Velocidade de movimento
var left_limit = -100  # Limite à esquerda
var right_limit = 100  # Limite à direita
var direction = 1  # Direção do movimento (1 = direita, -1 = esquerda)

# Referências
onready var sprite = $AnimatedSprite
onready var area = $Area2D
onready var collision_shape = $CollisionShape2D
var is_falling = false  # Flag para saber se o inimigo está caindo

func _ready():
	sprite.play("Walk")  # Inicia a animação de caminhada
	area.connect("body_entered", self, "_on_body_entered")  # Conectar o sinal para detectar colisões

func _process(delta):
	# Movimento do inimigo
	if direction == 1:
		# Movendo para a direita
		position.x += speed * delta
		sprite.flip_h = true
		if is_on_floor():
			sprite.play("Walk")
		
		# Verifica se atingiu o limite direito
		if position.x >= right_limit:
			direction = -1  # Muda a direção para a esquerda
			sprite.play("Walk")  # Troca para animação de caminhada

	elif direction == -1:
		# Movendo para a esquerda
		position.x -= speed * delta
		sprite.flip_h = false
		if is_on_floor():
			sprite.play("Walk")
		
		# Verifica se atingiu o limite esquerdo
		if position.x <= left_limit:
			direction = 1  # Muda a direção para a direita
			sprite.play("Walk")  # Troca para animação de caminhada

	# Animação de queda (se estiver caindo)
	if not is_on_floor() and not is_falling:
		sprite.play("Fall")
		is_falling = true  # Define a flag de queda

	if is_on_floor() and is_falling:
		is_falling = false  # Reseta a flag de queda

func _on_body_entered(body):
	# Quando um corpo entra na área do inimigo
	if body.is_in_group("Player"):  # Verifica se o corpo é do jogador (ou outro objeto)
		sprite.play("Die")  # Exibe a animação de morte
		# Após a animação de morte terminar, remove o inimigo
		yield(sprite, "animation_finished")
		queue_free()  # Remove o inimigo da cena
