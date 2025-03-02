extends Node2D

# Referências aos nós
onready var animacao = $AnimatedSprite
onready var area = $Area2D
onready var colisao = $Area2D/CollisionShape2D

# Referência ao CoinLabel (você pode arrastar e soltar a referência da cena no editor)
onready var coin_label = get_node("/root/Node2D/Coin/CoinLabelBase/CanvasLayer/CoinLabel")  # Caminho para a cena CoinLabelBase

# Função que roda no início
func _ready():
	animacao.play("Spin")  # A moeda começa girando

# Função chamada quando o Longuinho entra na área de colisão
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):  # Verifica se a colisão foi com Longuinho
		coletar_moeda()

# Função para coletar a moeda
func coletar_moeda():
	animacao.play("Collect")  # Toca a animação de coleta
	# Espera o tempo da animação de coleta e depois destrói a moeda
	yield(animacao, "animation_finished")  # Espera até a animação terminar
	coin_label.incrementar_moedas()  # Chama a função para incrementar as moedas
	queue_free()  # Remove a moeda da cena
