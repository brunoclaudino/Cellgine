extends Node2D

var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Peroxissomos'
var resumo = 'Quebra da agua oxigenada. Quebra de alcool. Presente na bicamada fosfolipídica da bainha de mielina (neurônios).'
var descricao = ['Quebra a água oxigenada usando uma enzima chamada catalase, quebrando a molécula gerando H20 e um átomo de oxigênio',
'Ajuda a formar a bicamada fosfolipídica da bainha de mielina (neurônios)',
'Faz quebra de 24% do alcool consumido. O resto é quebrado pelo R.E.L']


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func define_id(numero):
	self.id = numero
	
func em_mitose():
	pass

func define_posicao_pai(numero):
	self.posicao_pai = numero
