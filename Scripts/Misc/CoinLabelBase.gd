extends Node2D

# Referência ao Label onde o número de moedas será exibido
onready var coin_label = $CanvasLayer/CoinLabel

# Variável para contar as moedas (se você preferir usar um sistema global, pode usar um Singleton)
var moedas = 0

# Função que roda no início
func _ready():
	# Atualiza o Label com o número inicial de moedas
	atualizar_label()

# Função para atualizar o número de moedas exibido no Label
func atualizar_label():
	coin_label.text = "Coins: " + str(moedas)  # Atualiza o texto no Label

# Função para incrementar a quantidade de moedas
func incrementar_moedas():
	moedas += 1
	atualizar_label()  # Atualiza o texto do Label com o novo número de moedas

