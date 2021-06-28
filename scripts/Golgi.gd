extends Node2D

var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Complexo de Golgi'
var resumo = 'Armazena temporáriamente e empacota proteínas em vesículas para ser expelida, amadurece lisossomos'
var descricao = ['Funciona como \"Correios\" das células, pois empacota as proteínas que recebe do R.E.R em vesículas e manda para o exterior da células ou para a membrana plasmática',
'Termina a formação do Lisossomos (organela digestiva) que é feita no R.E.R mas amadurecida no complexo de Golgi',
'Pode formar o acrossomo da cabeça do espermatozóide, contendo enzimas que ajudarão na penetração do óvulo',
'Armazena temporariamente algumas proteínas']


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func define_id(numero):
	self.id = numero
	
func em_mitose():
	pass

func define_posicao_pai(numero):
	self.posicao_pai = numero
