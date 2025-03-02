extends KinematicBody2D

# Referências aos nós
onready var animated_sprite = $AnimatedSprite
onready var area2d = $Area2D
onready var health_label = $CanvasLayer/HealthLabel  # Label para exibir a vida

var health = 10
var speed = 100
var is_attacking = false

# Variáveis para movimento aleatório
var target_position = Vector2.ZERO
var move_timer = 0.0

# Instancia o gerador de números aleatórios
var rng = RandomNumberGenerator.new()

func _ready():
	# Inicializa a animação
	animated_sprite.play("Fly")
	
	# Desativa a colisão do KinematicBody2D inicialmente
	$CollisionShape2D.disabled = true

	# Habilita a detecção de colisão na Area2D
	area2d.monitoring = true

	# Define a posição inicial da abelha
	position = Vector2(0, 150)
	
	# Inicializa o timer para movimento aleatório
	move_timer = rng.randf_range(1.0, 2.0)  # Aleatório entre 1 e 2 segundos

	# Atualiza o label com a vida inicial
	update_health_label()

# Função para mover o boss para uma posição aleatória
func _process(delta):
	if move_timer > 0:
		move_timer -= delta
	else:
		# Move a abelha para uma posição aleatória
		target_position = Vector2(rng.randf_range(-300, 300), rng.randf_range(-200, 200))
		move_timer = rng.randf_range(1.0, 2.0)  # Reinicia o timer

	# Move suavemente a abelha em direção à posição alvo
	var direction = (target_position - position).normalized()
	move_and_slide(direction * speed)

# Função chamada quando qualquer corpo entra na área da abelha
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		# A abelha perde 1 vida ao encostar em qualquer corpo
		take_damage(1)

# Função para aplicar dano à abelha
func take_damage(damage):
	health -= damage
	update_health_label()  # Atualiza o texto do label com a nova vida

	# Se a vida da abelha chegar a 0, ela morre
	if health <= 0:
		die()

# Função para atualizar o label de vida
func update_health_label():
	health_label.text = "Health: %d" % health  # Atualiza o label para mostrar a vida atual

# Função chamada quando a abelha morre
func die():
	print("A abelha morreu!")
	
	# Muda para o menu principal (ajuste o caminho para o seu menu)
	get_tree().change_scene("res://Cutscenes/ToDyarnBeach.tscn")
	
	queue_free()  # Remove a abelha da cena
