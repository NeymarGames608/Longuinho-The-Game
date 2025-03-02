extends KinematicBody2D

# Variáveis do chefe
var health = 25  # Vida inicial do chefe
var speed = 100  # Velocidade de movimento do chefe (ajustada para ser mais lenta)
var target_position = Vector2()  # Posição alvo para onde o chefe vai deslizar
var move_timer = 0  # Timer para controlar a mudança de direção do chefe

onready var health_label = $HealthLabel/HealthLabel
onready var damage_area = $DamageArea  # A área de dano onde o player vai causar dano

var rng = RandomNumberGenerator.new()  # Inicializa o gerador de números aleatórios

var velocity = Vector2()  # Variável para controlar a velocidade do movimento do boss

func _ready():
	update_health_label()
	
	# Conecta o sinal de entrada da área de dano
	damage_area.connect("body_entered", self, "_on_damage_area_entered")
	
	# Definindo a primeira posição alvo
	choose_new_target_position()

# Função chamada a cada frame para mover o chefe
func _process(delta):
	move_boss(delta)

# Movimento suave do Boss (deslizando entre pontos)
func move_boss(delta):
	# Calcula a direção de movimento para o target
	var direction = (target_position - position).normalized()

	# Aplica a velocidade
	velocity = direction * speed
	
	# Mover o chefe e garantir que ele não atravesse colisões
	velocity = move_and_slide(velocity)

	# Quando o chefe atingir a posição alvo, escolhe uma nova posição
	if position.distance_to(target_position) < 10:  # Tolerância para chegar perto do alvo
		choose_new_target_position()

# Escolhe uma nova posição alvo aleatória dentro de um intervalo específico
func choose_new_target_position():
	# Posição aleatória dentro de um intervalo específico usando rng
	target_position = Vector2(rng.randf_range(25, 1000), rng.randf_range(200, 300))  # Intervalo ajustado
	move_timer = 0  # Reseta o timer ao escolher um novo alvo

# Função chamada quando o player entra na área de dano
func _on_damage_area_entered(body):
	if body.is_in_group("Player"):  # Verifica se o corpo que entrou é o jogador
		take_damage()  # Causa dano ao chefe

func take_damage():
	health -= 1
	update_health_label()
	if health <= 0:
		get_tree().change_scene("res://Scenes/MainMenu.tscn")

func update_health_label():
	health_label.text = "Boss HP: " + str(health)
