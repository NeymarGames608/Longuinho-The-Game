extends Node2D

var player_scene : PackedScene
var player_instance : Node2D

func _ready():
	# Carregar a cena do personagem selecionado com base na variável global
	match CharacterManager.selected_character:
		1:
			player_scene = load("res://Scenes/Players/Longuinho.tscn")
		2:
			player_scene = load("res://Scenes/Players/Vigou.tscn")
		3:
			player_scene = load("res://Scenes/Players/Fling.tscn")
		4:
			player_scene = load("res://Scenes/Players/Nina.tscn")

	# Instanciar o personagem na cena da fase
	player_instance = player_scene.instance()
	add_child(player_instance)  # Adiciona o personagem à cena da fase

	# Adicionar o personagem ao grupo "Player"
	player_instance.add_to_group("Player")
