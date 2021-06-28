extends Node2D

var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Nucleo'
var resumo = 'Armazena o DNA e faz controle de reações químicas'
var descricao = ['Maior organela da célula.',
'Armazenar DNA.',
'Controla reações químicas na célula.']


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func define_id(numero):
	self.id = numero
	
func em_mitose():
	pass

func define_posicao_pai(numero):
	self.posicao_pai = numero
