extends Node2D

var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Filamentos Intermediários'
var resumo = 'Proteção mecânica e adesão a células'
var descricao = ['Formado por protéinas fibrosas como queratina.',
'Une as células para formar tecidos.',
'Proteção mecânica evitando que os tecidos se rompam facilmente.']

func _ready():
	pass # Replace with function body.

func define_id(numero):
	self.id = numero
	
func em_mitose():
	pass

func define_posicao_pai(numero):
	self.posicao_pai = numero
